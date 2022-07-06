import 'package:flutter/material.dart';
import 'package:graduation_dashboard/App/constants.dart';
import '../../App/responsive.dart';
import 'components/header.dart';
import 'components/my_files.dart';
import 'components/resent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(Constants.defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: Constants.defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: Constants.defaultPadding),
                      // const RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: Constants.defaultPadding),
                      if (Responsive.isMobile(context)) const StorageDetails(),
                    ],
                  ),
                ),

                if (!Responsive.isMobile(context))
                  const SizedBox(width: Constants.defaultPadding),

                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
