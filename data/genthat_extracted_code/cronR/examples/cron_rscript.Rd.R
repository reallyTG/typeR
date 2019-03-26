library(cronR)


### Name: cron_rscript
### Title: Create a command to execute an R script which can be scheduled
###   with cron_add
### Aliases: cron_rscript

### ** Examples

f <- system.file(package = "cronR", "extdata", "helloworld.R")
cron_rscript(f)
cron_rscript(f, rscript_args = "more arguments passed on to the call")
cron_rscript(f, rscript_args = c("more", "arguments", "passed", "on", "to", "the", "call"))

cron_rscript(f, log_append = FALSE)
cron_rscript(f, log_append = TRUE)



