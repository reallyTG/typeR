library(googleAnalyticsR)


### Name: ga_custom_upload_file
### Title: Upload data to Google Analytics
### Aliases: ga_custom_upload_file

### ** Examples


## Not run: 
##D 
##D upload_me <- data.frame(medium = "shinyapps", 
##D                         source = "referral", 
##D                         adCost = 1, 
##D                         date = "20160801")
##D                         
##D obj <- ga_custom_upload_file(47850439, 
##D                              "UA-4748043-2", 
##D                              "_jDsJHSFSU-uw038Bh8fUg", 
##D                              upload_me)
##D                              
##D ## obj will initially have status = PENDING
##D obj
##D ==Google Analytics Custom Data Source Upload==
##D Custom Data Source ID:  _jDsJHSFSU-uw038Bh8fUg 
##D Account ID:             47850439 
##D Web Property Id:        UA-4748043-2 
##D Upload ID:              7yHLAkeLSiK1zveVTiWZwA 
##D Status:                 PENDING 
##D 
##D ## Send obj to ga_custom_upload() to check and renew status
##D obj <- ga_custom_upload(upload_object = obj)
##D obj
##D 
##D ==Google Analytics Custom Data Source Upload==
##D Custom Data Source ID:  _jDsJHSFSU-uw038Bh8fUg 
##D Account ID:             47850439 
##D Web Property Id:        UA-4748043-2 
##D Upload ID:              7yHLAkeLSiK1zveVTiWZwA 
##D Status:                 COMPLETED 
##D 
## End(Not run)





