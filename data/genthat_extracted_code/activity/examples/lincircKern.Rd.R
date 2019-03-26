library(activity)


### Name: lincircKern
### Title: Linear-circular kernel fit
### Aliases: lincircKern

### ** Examples

data(BCIspeed)
i <- BCIspeed$species=="ocelot"
log_speed <- log(BCIspeed$speed[i])
time <- BCIspeed$time[i]*2*pi
circseq <- seq(0,2*pi,pi/256)
trend <- lincircKern(circseq, time, log_speed)
plot(time, log_speed, xlim=c(0, 2*pi))
lines(circseq, trend)



