library(lumberjack)


### Name: simple
### Title: The simple logger.
### Aliases: simple
### Keywords: datasets

### ** Examples


logfile <- tempfile(fileext=".csv")
out <- women %L>%
  start_log(log=simple$new(verbose=FALSE)) %L>%
  identity() %L>%
  head() %L>% 
  dump_log(file=logfile, stop=TRUE)


read.csv(logfile,stringsAsFactors=FALSE)




