library(luzlogr)


### Name: printlog
### Title: Log a message
### Aliases: flaglog printlog

### ** Examples

logfile <- openlog("test.log")
printlog("message")
printlog(1, "plus", 1, "equals", 1 + 1)
closelog()
readLines(logfile)

logfile <- openlog("test", loglevel = 1)
printlog("This message will not appear", level = 0)
printlog("This message will appear", level = 1)
closelog()
readLines(logfile)



