## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE, eval = FALSE)

## ---- include = FALSE----------------------------------------------------
#  knitr::opts_chunk$set(comment = "#>", collapse = TRUE, eval = FALSE)

## ------------------------------------------------------------------------
#  library(cronR)
#  f <- system.file(package = "cronR", "extdata", "helloworld.R")
#  cmd <- cron_rscript(f)
#  cmd
#  
#  cron_add(command = cmd, frequency = 'minutely', id = 'test1', description = 'My process 1', tags = c('lab', 'xyz'))
#  cron_add(command = cmd, frequency = 'daily', at='7AM', id = 'test2')
#  cron_njobs()
#  
#  cron_ls()
#  cron_clear(ask=FALSE)
#  cron_ls()
#  
#  cmd <- cron_rscript(f, rscript_args = c("productx", "arg2", "123"))
#  cmd
#  cron_add(cmd, frequency = 'minutely', id = 'job1', description = 'Customers')
#  cron_add(cmd, frequency = 'hourly', id = 'job2', description = 'Weather')
#  cron_add(cmd, frequency = 'hourly', id = 'job3', days_of_week = c(1, 2))
#  cron_add(cmd, frequency = 'hourly', id = 'job4', at = '00:20', days_of_week = c(1, 2))
#  cron_add(cmd, frequency = 'daily', id = 'job5', at = '14:20')
#  cron_add(cmd, frequency = 'daily', id = 'job6', at = '14:20', days_of_week = c(0, 3, 5))
#  cron_add(cmd, frequency = 'daily', id = 'job7', at = '23:59', days_of_month = c(1, 30))
#  cron_add(cmd, frequency = 'monthly', id = 'job8', at = '10:30', days_of_month = 'first', days_of_week = '*')
#  cron_add(cmd, frequency = '@reboot', id = 'job9', description = 'Good morning')
#  cron_add(cmd, frequency = '*/15 * * * *', id = 'job10', description = 'Every 15 min')
#  cron_ls()
#  cron_clear(ask=FALSE)

## ------------------------------------------------------------------------
#  ## log file is at the place where the helloworld.R script was located
#  system.file("extdata", "helloworld.log", package = "cronR")

