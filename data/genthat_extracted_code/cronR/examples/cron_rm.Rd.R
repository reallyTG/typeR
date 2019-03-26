library(cronR)


### Name: cron_rm
### Title: Remove a cronjob
### Aliases: cron_rm

### ** Examples

## Not run: 
##D f <- system.file(package = "cronR", "extdata", "helloworld.R")
##D cmd <- cron_rscript(f)
##D cron_add(command = cmd, frequency = 'minutely', id = 'test1', description = 'My process 1')
##D cron_njobs()
##D cron_ls()
##D cron_rm(id = "test1")
##D cron_njobs()
##D cron_ls()
## End(Not run)



