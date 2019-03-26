library(ctrdata)


### Name: dfMergeTwoVariablesRelevel
### Title: Merge two variables into one, optionally map values to new
###   levels
### Aliases: dfMergeTwoVariablesRelevel

### ** Examples


## Not run: 
##D statusvalues <- list("ongoing" = c("Recruiting", "Active", "Ongoing",
##D                                    "Active, not recruiting", "Enrolling by invitation"),
##D                      "completed" = c("Completed", "Prematurely Ended", "Terminated"),
##D                      "other" = c("Withdrawn", "Suspended",
##D                                  "No longer available", "Not yet recruiting"))
##D 
##D dfMergeTwoVariablesRelevel(result, c("Recruitment", "x5_trial_status"), statusvalues)
## End(Not run)




