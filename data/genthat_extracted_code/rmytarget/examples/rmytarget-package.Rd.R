library(rmytarget)


### Name: rmytarget-package
### Title: Paxkage for load data from 'MyTarget API'.
### Aliases: rmytarget-package rmytarget rmytarget2
### Keywords: package

### ** Examples

## Not run: 
##D # Get objects
##D ## Get ads
##D Ads <- myTarGetAdList(login = "my_test_client")
##D 
##D ## Get campaigns
##D Campaigns <- myTarGetCampaignList(login = "my_test_client")
##D 
##D # Get statistic
##D # base metrics by campaigns
##D base_data <- myTarGetTotalData(date_from   = Sys.Date() - 7,
##D                                date_to     = Sys.Date(),
##D                                object_type = "campaigns",
##D                                object_id = Campaigns$id,
##D                                metrics = "base",
##D                                stat_type = "day",
##D                                login = "my_test_client", 
##D                                token_path = "mytarget_token")
##D 
##D # all metrics by campaigns
##D all_data <- myTarGetTotalData(date_from   = Sys.Date() - 7,
##D                               date_to     = Sys.Date(),
##D                               object_type = "campaigns",
##D                               object_id = Campaigns$id,
##D                               metrics = "all",
##D                               stat_type = "day",
##D                               login = "my_test_client", 
##D                               token_path = "mytarget_token")
##D 
##D # custom set of metric by campaigns
##D custom_data <- myTarGetTotalData(date_from   = Sys.Date() - 7,
##D                                  date_to     = Sys.Date(),
##D                                  object_type = "campaigns",
##D                                  object_id = Campaigns$id,
##D                                  metrics = c("base", "tps", "viral"),
##D                                  stat_type = "day",
##D                                  login = "my_test_client", 
##D                                  token_path = "mytarget_token")
##D 
##D 
##D # if have note objects id, base metrics by ads
##D base_data2 <- myTarGetStats(date_from   = as.Date("2013-01-01"),
##D                                 date_to     = Sys.Date(),
##D                                 object_type = "banners",
##D                                 metrics = "base",
##D                                 stat_type = "day",
##D                                 login = "my_test_client", 
##D                                 token_path = "mytarget_token")
## End(Not run)



