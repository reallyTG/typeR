library(qmap)


### Name: berngamma
### Title: The Bernoulli-Gamma distribution
### Aliases: berngamma dberngamma pberngamma qberngamma rberngamma
### Keywords: distribution

### ** Examples

data(obsprecip)

(ts <- startberngamma(obsprecip[,1]))
hist(obsprecip[,1],freq=FALSE) 
lines(seq(0,20),dberngamma(0:20,
                           prob=ts$prob,
                           scale=ts$scale,
                           shape=ts$shape),
      col="red")

pp <- seq(0.01,0.99,by=0.01)
qq <-quantile(obsprecip[,1],probs=pp) 

plot(qq,pp)
lines(qberngamma(pp,
                 prob=ts$prob,
                 scale=ts$scale,
                 shape=ts$shape),
      pp,col="red")

plot(qq,pp)
lines(qq,
      pberngamma(qq,
                 prob=ts$prob,
                 scale=ts$scale,
                 shape=ts$shape),
      col="red")

hist(rberngamma(1000,
                prob=ts$prob,
                scale=ts$scale,
                shape=ts$shape),freq=FALSE)



