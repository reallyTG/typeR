library(oce)


### Name: ctimeToSeconds
### Title: Interpret a character string as a time interval
### Aliases: ctimeToSeconds

### ** Examples


library(oce)
cat("10      = ", ctimeToSeconds("10"), "s\n", sep="")
cat("01:04   = ", ctimeToSeconds("01:04"), "s\n", sep="")
cat("1:00:00 = ", ctimeToSeconds("1:00:00"), "s\n", sep="")



