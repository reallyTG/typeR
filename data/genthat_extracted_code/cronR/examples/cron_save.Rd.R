library(cronR)


### Name: cron_save
### Title: Save the current crontab
### Aliases: cron_save

### ** Examples

## Not run: 
##D cron_add(command = cron_rscript(system.file(package = "cronR", "extdata", "helloworld.R")), 
##D   frequency = 'minutely', id = 'test1', description = 'My process 1')
##D cron_save(file="crontab_backup", overwrite=TRUE)
##D cron_clear()
##D cron_load(file="crontab_backup")
## End(Not run)



