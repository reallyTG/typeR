library(ApacheLogProcessor)


### Name: parse.php.msgs
### Title: Parses PHP mesages and store its parts in a data frame that
###   contains level, message, file, line number and referer.
### Aliases: parse.php.msgs

### ** Examples


#Loads the path of the erro log
path <- system.file("examples", "error_log.log", package = "ApacheLogProcessor")

#Loads the error log to a data frame
dfELog <- read.apache.error.log(path)

dfPHPMsgs <- parse.php.msgs(dfELog)





