library(MESS)


### Name: smokehealth
### Title: Effect of smoking on self reported health
### Aliases: smokehealth
### Keywords: datasets

### ** Examples


data(smokehealth)
m <- smokehealth
m[,3] <- m[,3]+ m[,4]
m[4,] <- m[4,] + m[5,]
m <- m[1:4,1:3]
gkgamma(m)
chisq.test(m)




