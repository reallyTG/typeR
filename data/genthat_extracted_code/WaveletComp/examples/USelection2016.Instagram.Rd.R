library(WaveletComp)


### Name: USelection2016.Instagram
### Title: Hourly time series of the number of candidate-related media
###   posted on Instagram during the week before the 2016 US presidential
###   election
### Aliases: USelection2016.Instagram
### Keywords: datasets

### ** Examples


data(USelection2016.Instagram)
attach(USelection2016.Instagram)

my.date <- as.POSIXct(date, format = "%F %T", tz = "EST5EDT")

plot(my.date, trump.pos, type = "l", col = 1, lwd = 2,
     ylab = "number of media posted on Instagram", ylim = c(0,6e+6),
     xlab = "the week before the Election Day (Tuesday, 2016-11-08)")
lines(my.date, clinton.pos, col = 2, lwd = 2) 
lines(my.date, trump.neg, col = 3, lwd = 2)
lines(my.date, clinton.neg, col = 4, lwd = 2) 
legend("topleft", legend=names(USelection2016.Instagram[-1]), 
       lty = 1, lwd = 2, col = 1:4) 

detach(USelection2016.Instagram)




