library(activity)


### Name: fitlincirc
### Title: Linear-circular regression
### Aliases: fitlincirc

### ** Examples

#Example with reps limited to increase speed
data(BCIspeed)
i <- BCIspeed$species=="ocelot"
sp <- log(BCIspeed$speed[i])
tm <- BCIspeed$time[i]*2*pi
mod <- fitlincirc(tm, sp, reps=50)
plot(mod, CircScale=24, xaxp=c(0,24,4), xlab="Time", ylab="log(speed)")
legend(8,-3, c("Fitted speed", "Null CI"), col=1:2, lty=1:2)



