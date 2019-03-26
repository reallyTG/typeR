library(activity)


### Name: redf
### Title: Random numbers from empirical distribution function.
### Aliases: redf

### ** Examples

data(BCItime)
tm <- 2*pi*subset(BCItime, species=="paca")$time
mod <- fitact(tm)
rn <- redf(1000, as.data.frame(mod@pdf))



