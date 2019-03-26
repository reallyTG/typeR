## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
library(ParallelLogger)
knitr::opts_chunk$set(
  cache = FALSE,
  comment = "#>",
  error = FALSE,
  tidy = FALSE)

## ------------------------------------------------------------------------
logger <- createLogger(name = "SIMPLE",
                       threshold = "INFO",
                       appenders = list(createConsoleAppender(layout = layoutTimestamp)))

registerLogger(logger)

logTrace("This event is below the threshold (INFO)")

logInfo("Hello world")

## ------------------------------------------------------------------------
clearLoggers()

logger <- createLogger(name = "SIMPLE",
                       threshold = "INFO",
                       appenders = list(createConsoleAppender(layout = layoutTimestamp)))

registerLogger(logger)

logInfo("Hello world")

## ---- eval=FALSE---------------------------------------------------------
#  addDefaultConsoleLogger()

## ---- eval=FALSE---------------------------------------------------------
#  registerLogger(createLogger(name = "SIMPLE",
#                              threshold = "INFO",
#                              appenders = list(createConsoleAppender(layout = layoutSimple))))

## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
logFileName <- tempfile()

## ---- eval=FALSE---------------------------------------------------------
#  logFileName <- "log.txt"

## ------------------------------------------------------------------------
logger <- createLogger(name = "PARALLEL",
                       threshold = "TRACE",
                       appenders = list(createFileAppender(layout = layoutParallel,
                                                           fileName = logFileName)))
registerLogger(logger)

logTrace("Executed this line")

logDebug("There are ",  length(getLoggers()), " loggers")

logInfo("Hello world")

## ------------------------------------------------------------------------
writeLines(readChar(logFileName, file.info(logFileName)$size))

## ------------------------------------------------------------------------
unlink(logFileName)

## ---- eval=FALSE---------------------------------------------------------
#  addDefaultFileLogger(logFileName)

## ---- eval=FALSE---------------------------------------------------------
#  registerLogger(createLogger(name = "DEFAULT",
#                              threshold = "TRACE",
#                              appenders = list(createFileAppender(layout = layoutParallel,
#                                                                    fileName = logFileName))))

## ---- eval=FALSE---------------------------------------------------------
#  clearLoggers()
#  addDefaultFileLogger(logFileName)
#  
#  warning("Danger!")
#  
#  # This throws a warning:
#  as.numeric('a')
#  
#  # This throws an error:
#  a <- b
#  
#  writeLines(readChar(logFileName, file.info(logFileName)$size))

## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
# knitr seems to use the same hook to capture warnings and errors, so minor cheat here:
clearLoggers()
addDefaultFileLogger(logFileName)
logWarn("Danger!")
logWarn("Warning: NAs introduced by coercion")
logFatal("Error: object a not found")
writeLines(readChar(logFileName, file.info(logFileName)$size))

## ------------------------------------------------------------------------
unlink(logFileName) # Clean up log file from the previous example
clearLoggers() # Clean up the loggers from the previous example

addDefaultFileLogger(logFileName)

cluster <- makeCluster(3)

fun <- function(x) {
  ParallelLogger::logInfo("The value of x is ", x)
  # Do something
  if (x == 6)
    ParallelLogger::logDebug("X equals 6")
  return(NULL)
}

dummy <- clusterApply(cluster, 1:10, fun, progressBar = FALSE)

stopCluster(cluster)

writeLines(readChar(logFileName, file.info(logFileName)$size))

## ---- eval=FALSE---------------------------------------------------------
#  launchLogViewer(logFileName)

## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
unlink(logFileName)

