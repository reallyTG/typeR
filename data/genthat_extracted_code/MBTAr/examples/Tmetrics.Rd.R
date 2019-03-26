library(MBTAr)


### Name: Tmetrics
### Title: Query real-time performance statistics.
### Aliases: Tmetrics

### ** Examples

  ## Authenticate:
  ## Don't show: 
  test_key <- "Zt0g4Tkp2kaLNxoKFXI_Kg"
  
## End(Don't show)
  mykey <- NULL
  mykey <- assign("mykey", value = test_key, envir = .GlobalEnv)
  ## use your own key from http://realtime.mbta.com/Portal/ instead of the test key

  Tmetrics(from_stop_id = NULL, # entire line
  to_stop_id = NULL, # entire line
  route_id = "Red", # Red Line
  direction = 0, # southbound only
  from_datetime = (Sys.time() - 3600), # 30 minutes ago
  to_datetime = Sys.time(), # now
api_key = mykey) # user-defined API key

## Returns:
#      threshold_id threshold_type   threshold_name metric_result
# 1 threshold_id_01      wait_time          Headway        0.8395
# 2 threshold_id_02      wait_time          Big Gap        0.9395
# 3 threshold_id_03      wait_time       2X Headway        0.9809
# 4 threshold_id_04    travel_time delayed < 3 min.        0.9792
# 5 threshold_id_05    travel_time delayed < 6 min.        0.9963




