library(luzlogr)


### Name: closelog
### Title: Close current logfile
### Aliases: closelog

### ** Examples

logfile <- openlog("A.log")
printlog("message to A", flag = TRUE)
logfile <- openlog("B.log")
printlog("message to B")
flagcountB <- closelog()
flagcountA <- closelog(sessionInfo = FALSE)



