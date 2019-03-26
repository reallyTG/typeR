library(kappalab)


### Name: expect.Choquet.unif-methods
### Title: Expectation and standard deviation of the Choquet integral in
###   the uniform and normal cases
### Aliases: expect.Choquet.unif sd.Choquet.unif
###   expect.Choquet.unif-methods sd.Choquet.unif-methods
###   expect.Choquet.unif,game-method sd.Choquet.unif,game-method
###   expect.Choquet.norm sd.Choquet.norm expect.Choquet.norm-methods
###   sd.Choquet.norm-methods expect.Choquet.norm,game-method
###   sd.Choquet.norm,game-method expect.Choquet.norm,Mobius.game-method
### Keywords: methods

### ** Examples


## a capacity
mu <- capacity(c(0,0.1,0.6,rep(0.9,4),1))

## the expectation and the standard deviation
## of the Choquet integral in the uniform case
expect.Choquet.unif(mu)
sd.Choquet.unif(mu)

## the same but empirically
m <- 10000
ch <- numeric(m)
for (i in 1:m) {
     f <- runif(3) 
     ch[i] <- Choquet.integral(mu,f)
}
mean(ch)
sd(ch)

## the expectation and the standard deviation
## of the Choquet integral in the normal case
expect.Choquet.norm(mu)
sd.Choquet.norm(mu)
expect.Choquet.norm(Mobius(mu))

## the same but empirically
for (i in 1:m) {
     f <- rnorm(3) 
     ch[i] <- Choquet.integral(mu,f)
}
mean(ch)
sd(ch)




