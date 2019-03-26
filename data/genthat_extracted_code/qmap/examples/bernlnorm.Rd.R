library(qmap)


### Name: bernlnorm
### Title: The Bernoulli-Log-Normal distribution
### Aliases: bernlnorm dbernlnorm pbernlnorm qbernlnorm rbernlnorm
### Keywords: distribution

### ** Examples

data(obsprecip)

(ts <- startbernlnorm(obsprecip[,1]))
hist(obsprecip[,1],freq=FALSE)
lines(seq(0,20),dbernlnorm(0:20,
                           prob=ts$prob,
                           meanlog=ts$meanlog,
                           sdlog=ts$sdlog),
      col="red")

pp <- seq(0.01,0.99,by=0.01)
qq <-quantile(obsprecip[,1],probs=pp) 

plot(qq,pp)
lines(qbernlnorm(pp,
                 prob=ts$prob,
                 meanlog=ts$meanlog,
                 sdlog=ts$sdlog),
      pp,col="red")

plot(qq,pp)
lines(qq,
      pbernlnorm(qq,
                 prob=ts$prob,
                 meanlog=ts$meanlog,
                 sdlog=ts$sdlog),
      col="red")

hist(rbernlnorm(1000,prob=ts$prob,
                meanlog=ts$meanlog,
                sdlog=ts$sdlog),freq=FALSE)




