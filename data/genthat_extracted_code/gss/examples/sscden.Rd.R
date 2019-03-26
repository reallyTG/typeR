library(gss)


### Name: sscden
### Title: Estimating Conditional Probability Density Using Smoothing
###   Splines
### Aliases: sscden sscden1
### Keywords: smooth models distribution

### ** Examples

data(penny); set.seed(5732)
fit <- sscden1(~year*mil,~mil,data=penny,
              ydomain=data.frame(mil=c(49,61)))
yy <- 1944+(0:92)/2
quan <- qsscden(fit,c(.05,.25,.5,.75,.95),
                data.frame(year=yy))
plot(penny$year+.1*rnorm(90),penny$mil,ylim=c(49,61))
for (i in 1:5) lines(yy,quan[i,])
## Clean up
## Not run: rm(penny,yy,quan)



