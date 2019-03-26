library(embryogrowth)


### Name: predict.tsd
### Title: Estimate sex ratio according to constant incubation temperature
### Aliases: predict.tsd

### ** Examples

## Not run: 
##D library(embryogrowth)
##D m <- c(10, 14, 7, 4, 3, 0, 0)
##D f <- c(0, 1, 2, 4, 15, 10, 13)
##D t <- c(25, 26, 27, 28, 29, 30, 31)
##D result <- tsd(males=m, females=f, temperatures=t)
##D plot(result)
##D predict(result, temperatures=c(25, 31), replicate.CI = 10000)
##D predict(result, temperatures=c(25, 31), SD.temperatures = c(1, 2), replicate.CI = 10000)
##D d <- c(72, 70, 65, 63, 62, 60, 59)
##D result <- tsd(males=m, females=f, durations=d)
##D predict(result, durations=c(67, 68), replicate.CI = 10000)
## End(Not run)



