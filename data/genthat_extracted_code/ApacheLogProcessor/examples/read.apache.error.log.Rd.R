library(ApacheLogProcessor)


### Name: read.apache.error.log
### Title: Read the apache erro log file and loads it to a data frame.
### Aliases: read.apache.error.log

### ** Examples


#Loads the path of the erro log
path <- system.file("examples", "error_log.log", package = "ApacheLogProcessor")

#Loads the error log to a data frame
dfELog <- read.apache.error.log(path)




