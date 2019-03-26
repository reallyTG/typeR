library(insol)


### Name: sunr
### Title: Earth radius vector
### Aliases: sunr

### ** Examples


# plot the variation of the earth radius vector over the next year
days_nexty = seq(Sys.time(),Sys.time()+86400*365,by='day')
plot(days_nexty,sunr(JD(days_nexty)),xlab='Date',ylab='Earth Radius Vector [AU]')
abline(h=1,col=8)



