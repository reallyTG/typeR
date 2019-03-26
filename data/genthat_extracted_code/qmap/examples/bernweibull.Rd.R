library(qmap)


### Name: bernweibull
### Title: The Bernoulli-Weibull distribution
### Aliases: bernweibull dbernweibull pbernweibull qbernweibull
###   rbernweibull
### Keywords: distribution

### ** Examples

data(obsprecip)

(ts <- startbernweibull(obsprecip[,1]))
hist(obsprecip[,1],freq=FALSE) 
lines(seq(0,max(obsprecip[,1])),
      dbernweibull(seq(0,max(obsprecip[,1])),
                   prob=ts$prob,
                   shape=ts$shape,
                   scale=ts$scale),
      col="red")

pp <- seq(0.01,0.99,by=0.01)
qq <-quantile(obsprecip[,1],probs=pp) 

plot(qq,pp)
lines(qbernweibull(pp,
                   prob=ts$prob,
                   scale=ts$scale,
                   shape=ts$shape),
      pp,col="red")

plot(qq,pp)
lines(qq,
      pbernweibull(qq,
                   prob=ts$prob,
                   scale=ts$scale,
                   shape=ts$shape),
      col="red")

hist(rbernweibull(1000,prob=ts$prob,
                      shape=ts$shape,
                      scale=ts$scale),freq=TRUE)




