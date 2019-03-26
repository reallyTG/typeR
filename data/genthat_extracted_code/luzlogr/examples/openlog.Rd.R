library(luzlogr)


### Name: openlog
### Title: Open a new logfile
### Aliases: openlog

### ** Examples

logfile <- openlog("test.log")
printlog("message")
closelog()
readLines(logfile)



