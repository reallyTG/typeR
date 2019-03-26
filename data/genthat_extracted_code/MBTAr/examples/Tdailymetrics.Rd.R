library(MBTAr)


### Name: Tdailymetrics
### Title: Query daily performance statistics.
### Aliases: Tdailymetrics

### ** Examples

  ## Authenticate:
  ## Don't show: 
  test_key <- "Zt0g4Tkp2kaLNxoKFXI_Kg"
  
## End(Don't show)
  mykey <- NULL
  mykey <- assign("mykey", value = test_key, envir = .GlobalEnv)
  ## use your own key from http://realtime.mbta.com/Portal/ instead of the test key

  Tdailymetrics(route_id="Red", # metrics for the Red Line
from_date=(Sys.Date()-8), # 8 days ago
to_date=Sys.Date()-1, # to yesterday (a full week of performance)
api_key = mykey) # user-defined API key

## Returns:
#
# service_date route_id    threshold_id threshold_type   threshold_name metric_result
# 1    2015-11-05      Red threshold_id_01      wait_time          Headway        0.8623
# 2    2015-11-05      Red threshold_id_02      wait_time          Big Gap        0.9398
# 3    2015-11-05      Red threshold_id_03      wait_time       2X Headway        0.9769
# 4    2015-11-05      Red threshold_id_04    travel_time delayed < 3 min.        0.9653
# 5    2015-11-05      Red threshold_id_05    travel_time delayed < 6 min.         0.996
# 6    2015-11-06      Red threshold_id_01      wait_time          Headway         0.864
# 7    2015-11-06      Red threshold_id_02      wait_time          Big Gap        0.9443
# 8    2015-11-06      Red threshold_id_03      wait_time       2X Headway        0.9814
# 9    2015-11-06      Red threshold_id_04    travel_time delayed < 3 min.        0.9549
# 10   2015-11-06      Red threshold_id_05    travel_time delayed < 6 min.        0.9928
# 11   2015-11-07      Red threshold_id_01      wait_time          Headway        0.7365
# 12   2015-11-07      Red threshold_id_02      wait_time          Big Gap          0.89
# 13   2015-11-07      Red threshold_id_03      wait_time       2X Headway         0.952
# 14   2015-11-07      Red threshold_id_04    travel_time delayed < 3 min.        0.9853
# 15   2015-11-07      Red threshold_id_05    travel_time delayed < 6 min.        0.9979
# 16   2015-11-08      Red threshold_id_01      wait_time          Headway        0.7808
# 17   2015-11-08      Red threshold_id_02      wait_time          Big Gap        0.8972
# 18   2015-11-08      Red threshold_id_03      wait_time       2X Headway        0.9582
# 19   2015-11-08      Red threshold_id_04    travel_time delayed < 3 min.        0.9997
# 20   2015-11-08      Red threshold_id_05    travel_time delayed < 6 min.        0.9999
# 21   2015-11-09      Red threshold_id_01      wait_time          Headway        0.8515
# 22   2015-11-09      Red threshold_id_02      wait_time          Big Gap        0.9344
# 23   2015-11-09      Red threshold_id_03      wait_time       2X Headway        0.9768
# 24   2015-11-09      Red threshold_id_04    travel_time delayed < 3 min.        0.9403
# 25   2015-11-09      Red threshold_id_05    travel_time delayed < 6 min.         0.977
# 26   2015-11-10      Red threshold_id_01      wait_time          Headway        0.8698
# 27   2015-11-10      Red threshold_id_02      wait_time          Big Gap        0.9479
# 28   2015-11-10      Red threshold_id_03      wait_time       2X Headway        0.9805
# 29   2015-11-10      Red threshold_id_04    travel_time delayed < 3 min.        0.9725
# 30   2015-11-10      Red threshold_id_05    travel_time delayed < 6 min.        0.9976
# 31   2015-11-11      Red threshold_id_01      wait_time          Headway        0.8854
# 32   2015-11-11      Red threshold_id_02      wait_time          Big Gap        0.9605
# 33   2015-11-11      Red threshold_id_03      wait_time       2X Headway        0.9874
# 34   2015-11-11      Red threshold_id_04    travel_time delayed < 3 min.        0.9856
# 35   2015-11-11      Red threshold_id_05    travel_time delayed < 6 min.        0.9995
# 36   2015-11-12      Red threshold_id_01      wait_time          Headway        0.8573
# 37   2015-11-12      Red threshold_id_02      wait_time          Big Gap        0.9399
# 38   2015-11-12      Red threshold_id_03      wait_time       2X Headway        0.9772
# 39   2015-11-12      Red threshold_id_04    travel_time delayed < 3 min.        0.9315
# 40   2015-11-12      Red threshold_id_05    travel_time delayed < 6 min.        0.9806




