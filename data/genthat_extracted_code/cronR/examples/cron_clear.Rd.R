library(cronR)


### Name: cron_clear
### Title: Clear all cron jobs
### Aliases: cron_clear

### ** Examples

## Not run: 
##D f <- system.file(package = "cronR", "extdata", "helloworld.R")
##D cmd <- cron_rscript(f)
##D cron_add(command = cmd, frequency = 'minutely', id = 'test1', description = 'My process 1')
##D cron_add(command = cmd, frequency = 'daily', at="7AM", id = 'test2', description = 'My process 2')
##D cron_njobs()
##D 
##D cron_ls()
##D cron_clear(ask=FALSE)
##D cron_ls()
## End(Not run)



