library(IAT)


### Name: cleanIAT
### Title: Clean IAT data using the updated D-Scoring algorithm
### Aliases: cleanIAT

### ** Examples

# Get Ps who recieve Math-Male sorting task in first blocks

cong_first <- IATData[IATData$isCongruentFirst == 1, ]

dscore_first <- cleanIAT(my_data = cong_first,
                         block_name = "BLOCK_NAME_S",
                         trial_blocks = c("BLOCK2", "BLOCK3", "BLOCK5", "BLOCK6"),
                         session_id = "SESSION_ID",
                         trial_latency = "TRIAL_LATENCY",
                         trial_error = "TRIAL_ERROR",
                         v_error = 1, v_extreme = 2, v_std = 1)

# Get Ps who recieve Math-Female sorting task in first blocks

cong_second <- IATData[IATData$isCongruentFirst == 0, ]

dscore_second <- cleanIAT(my_data = cong_second,
                          block_name = "BLOCK_NAME_S",
                          trial_blocks = c("BLOCK2", "BLOCK3", "BLOCK5", "BLOCK6"),
                          session_id = "SESSION_ID",
                          trial_latency = "TRIAL_LATENCY",
                          trial_error = "TRIAL_ERROR",
                          v_error = 1, v_extreme = 2, v_std = 1)

d_score <- rbind(dscore_first, dscore_second)
                                                      



