library(ParallelLogger)


### Name: launchLogViewer
### Title: Launch the log viewer Shiny app
### Aliases: launchLogViewer

### ** Examples

# Create a log file:
logFile <- file.path(tempdir(), "log.txt")
addDefaultFileLogger(logFile)
logInfo("Hello world")

# Launch the log file viewer (only if in interactive mode):
if (interactive()) {
  launchLogViewer(logFile)
}

# Delete the log file:
unlink(logFile)




