library(cronR)


### Name: cron_add
### Title: Make a simple cron job
### Aliases: cron_add cronjob

### ** Examples

## Not run: 
##D f <- system.file(package = "cronR", "extdata", "helloworld.R")
##D cmd <- cron_rscript(f)
##D cmd
##D 
##D cron_add(command = cmd, frequency = 'minutely', 
##D   id = 'test1', description = 'My process 1', tags = c('lab', 'xyz'))
##D cron_add(command = cmd, frequency = 'daily', at='7AM', id = 'test2')
##D cron_njobs()
##D 
##D cron_ls()
##D cron_clear(ask=FALSE)
##D cron_ls()
##D 
##D cmd <- cron_rscript(f, rscript_args = c("productx", "arg2", "123"))
##D cmd
##D cron_add(cmd, frequency = 'minutely', id = 'job1', description = 'Customers')
##D cron_add(cmd, frequency = 'hourly', id = 'job2', description = 'Weather')
##D cron_add(cmd, frequency = 'hourly', id = 'job3', days_of_week = c(1, 2))
##D cron_add(cmd, frequency = 'hourly', id = 'job4', at = '00:20', days_of_week = c(1, 2))
##D cron_add(cmd, frequency = 'daily', id = 'job5', at = '14:20')
##D cron_add(cmd, frequency = 'daily', id = 'job6', at = '14:20', days_of_week = c(0, 3, 5))
##D cron_add(cmd, frequency = 'daily', id = 'job7', at = '23:59', days_of_month = c(1, 30))
##D cron_add(cmd, frequency = 'monthly', id = 'job8', at = '10:30', 
##D   days_of_month = 'first', days_of_week = '*')
##D cron_add(cmd, frequency = '@reboot', id = 'job9', description = 'Good morning')
##D cron_add(cmd, frequency = '*/15 * * * *', id = 'job10', description = 'Every 15 min')   
##D cron_ls()
##D cron_clear(ask=FALSE)
## End(Not run)



