library(activity)


### Name: compareTimes
### Title: Compare activity between times of day
### Aliases: compareTimes

### ** Examples

data(BCItime)
tPaca <- 2*pi*BCItime$time[BCItime$species=="paca"]
fPaca <- fitact(tPaca, sample="data", reps=10)
plot(fPaca)
compareTimes(fPaca, c(5.5,6,0.5,1))



