library(rmytarget)


### Name: myTarGetStats
### Title: Get stat by any 'MyTarget API' objects
### Aliases: myTarGetStats
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D # base metrics by campaigns
##D base_data <- myTarGetStats(date_from   = Sys.Date() - 7,
##D                            date_to     = Sys.Date(),
##D                            object_type = "campaigns",
##D                            metrics = "base",
##D                            stat_type = "day",
##D                            login = "client_login", 
##D                            token_path = "D:\mytarget_token")
##D 
##D # all metrics by campaigns
##D all_data <- myTarGetStats(date_from   = Sys.Date() - 7,
##D                           date_to     = Sys.Date(),
##D                           object_type = "campaigns",
##D                           metrics = "all",
##D                           stat_type = "day",
##D                           login = "client_login", 
##D                           token_path = "D:\mytarget_token")
##D 
##D # custom set of metric by campaigns
##D custom_data <- myTarGetStats(date_from   = Sys.Date() - 7,
##D                              date_to     = Sys.Date(),
##D                              object_type = "campaigns",
##D                              metrics = c("base", "tps", "viral"),
##D                              stat_type = "day",
##D                              login = "client_login", 
##D                              token_path = "D:\mytarget_token")
##D 
##D 
##D # if have note objects id, base metrics by ads
##D base_data2 <- myTarGetStats(date_from   = as.Date("2013-01-01"),
##D                             date_to     = Sys.Date(),
##D                             object_type = "banners",
##D                             metrics = "base",
##D                             stat_type = "day",
##D                             login = "client_login", 
##D                             token_path = "D:\mytarget_token")
##D 							
##D # get all stats group by clients, only for agency account
##D client_stat <-  myTarGetStats(date_from   = Sys.Date() - 7,
##D                               date_to     = Sys.Date(),
##D                               object_type = "users",
##D                               metrics     = "all",
##D                               login       = "agency_login")
## End(Not run)



