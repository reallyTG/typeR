library(anMC)


### Name: get_chronotime
### Title: Measure elapsed time with C++11 chrono library
### Aliases: get_chronotime

### ** Examples

# Measure 1 second sleep
initT<-get_chronotime()
Sys.sleep(1)
measT<-(get_chronotime()-initT)*1e-9
cat("1 second passed in ",measT," seconds.\n")



