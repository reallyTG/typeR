library(RHawkes)


### Name: pred.den
### Title: RHawkes predictive density function
### Aliases: pred.den
### Keywords: prediction point process

### ** Examples

data(quake);
tms <- sort(quake$time);
# add some random noise to the identical event times
tms[213:214] <- tms[213:214] + 
                    sort(c(runif(1, -1, 1)/(24*60), runif(1, -1, 1)/(24*60)))
curve(pred.den(x, tms = tms, cens = 35064, par= c(0.314, 22.2, 1266, 0.512)) 
        ,0 ,2000, col = 2, lty = 2)



