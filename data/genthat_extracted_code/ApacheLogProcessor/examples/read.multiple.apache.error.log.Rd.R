library(ApacheLogProcessor)


### Name: read.multiple.apache.error.log
### Title: Reads multiple apache error log files and loads them to a data
###   frame.
### Aliases: read.multiple.apache.error.log

### ** Examples


path <- system.file("examples", package="ApacheLogProcessor")
path <- paste(path, "/", sep="")

#read multiple gziped logs with the prefix m_access_log_combined_
dfELog <- read.multiple.apache.error.log(path, "m_error_log_")




