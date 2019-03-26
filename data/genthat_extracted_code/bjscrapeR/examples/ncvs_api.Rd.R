library(bjscrapeR)


### Name: ncvs_api
### Title: Request Data from the National Crime Victimization Survey (NCVS)
### Aliases: ncvs_api
### Keywords: bjs crime law policy victimization

### ** Examples


# A request for personal victimization survey for the year 2012
## No test: 
dat <- ncvs_api(year = 2012, dataset = "personal", population = FALSE)
## End(No test)

# A request for household victimization survey for the year 1994
## No test: 
dat <- ncvs_api(year = 1994, dataset = "household", population = FALSE)
## End(No test)




