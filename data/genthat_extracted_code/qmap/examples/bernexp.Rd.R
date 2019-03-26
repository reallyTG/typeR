library(qmap)


### Name: bernexp
### Title: The Bernoulli-Exponential distribution
### Aliases: bernexp dbernexp pbernexp qbernexp rbernexp
### Keywords: distribution

### ** Examples

data(obsprecip)

(ts <- startbernexp(obsprecip[,1]))
hist(obsprecip[,1],freq=FALSE) 
lines(seq(0,max(obsprecip[,1])),
      dbernexp(seq(0,max(obsprecip[,1])),
               prob=ts$prob,
               rate=ts$rate),
      col="red")

pp <- seq(0.01,0.99,by=0.01)
qq <-quantile(obsprecip[,1],probs=pp) 

plot(qq,pp)
lines(qbernexp(pp,
               prob=ts$prob,
               rate=ts$rate),
      pp,col="red")

plot(qq,pp)
lines(qq,
      pbernexp(qq,
               prob=ts$prob,
               rate=ts$rate),
      col="red")

hist(rbernexp(1000,prob=ts$prob,
              rate=ts$rate),freq=FALSE)




