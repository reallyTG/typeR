library(ApacheLogProcessor)


### Name: read.multiple.apache.access.log
### Title: Reads multiple files of apache web server.
### Aliases: read.multiple.apache.access.log

### ** Examples

path <- system.file("examples", package="ApacheLogProcessor")
path <- paste(path, "/", sep="")

#read multiple gziped logs with the prefix m_access_log_combined_
dfLog <- read.multiple.apache.access.log(path, "m_access_log_combined_")




