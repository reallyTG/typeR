library(RSauceLabs)


### Name: getUserAccountUsage
### Title: Get User Account Usage
### Aliases: getUserAccountUsage

### ** Examples

## Not run: 
##D myAcc <- account()
##D jobActivity <- getRealTimeJobActivity(myAcc)
##D #> jobActivity$concurrency$self$allowed
##D #$manual
##D #[1] 5
##D #
##D #$mac
##D #[1] 5
##D #
##D #$overall
##D #[1] 5
##D #
##D #$real_device
##D #[1] 0
##D userActivity <- getUserActivity(myAcc)
##D #> userActivity$subaccounts$rsaucelabs
##D #$`in progress`
##D #[1] 0
##D #
##D #$all
##D #[1] 0
##D #
##D #$queued
##D #[1] 0
##D userAccUsage <- getUserAccountUsage(myAcc)
##D #> userAccUsage
##D #user_name      date no_of_jobs vm_minutes
##D #1: seleniumPipes 2016-8-12          2        239
##D #2: seleniumPipes 2016-8-13         65       6399
##D #3: seleniumPipes 2016-8-15         36       7235
##D #4: seleniumPipes 2016-8-16          7       1101
## End(Not run)



