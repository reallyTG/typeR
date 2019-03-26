library(hms)


### Name: hms
### Title: A simple class for storing time-of-day values
### Aliases: hms is.hms as.hms as.hms.default as.hms.difftime
###   as.hms.numeric as.hms.character as.hms.POSIXt as.hms.POSIXlt
###   as.POSIXct.hms as.POSIXlt.hms as.character.hms as.data.frame.hms
###   format.hms print.hms

### ** Examples

hms(56, 34, 12)
hms()
as.hms(1)
as.hms("12:34:56")
as.hms(Sys.time())
as.POSIXct(hms(1))
data.frame(a = hms(1))
d <- data.frame(hours = 1:3)
d$hours <- hms(hours = d$hours)
d



