library(googleAnalyticsR)


### Name: ga_unsampled_list
### Title: List Unsampled Reports
### Aliases: ga_unsampled_list

### ** Examples


## Not run: 
##D 
##D     # get data.frame of unsampled reports you have available
##D     unsample_list <- ga_unsampled_list(accountId = "12345", 
##D                                        webPropertyId = "UA-12345-4", 
##D                                        profileId = "129371234")
##D                                        
##D     # loop through unsampled reports and download as a list of data.frames
##D     dl <- lapply(unsample_list$title, ga_unsampled_download, 
##D                  accountId = "12345", 
##D                  webPropertyId = "UA-12345-4", 
##D                  profileId = "129371234", 
##D                  downloadFile = FALSE)
##D                  
##D     # inspect first data.frame
##D     dl[[1]]
##D     
##D     # download unsampled report to csv file
##D     ga_unsampled_download("my_report_title", 
##D                           accountId = "12345", 
##D                           webPropertyId = "UA-12345-4", 
##D                           profileId = "129371234")
##D 
## End(Not run)






