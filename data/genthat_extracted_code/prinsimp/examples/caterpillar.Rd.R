library(prinsimp)


### Name: caterpillar
### Title: Kingsolver _et al._ caterpillar estimated covariance
### Aliases: caterpillar
### Keywords: datasets

### ** Examples

library(prinsimp)

data(caterpillar)
cat.sim <- simpart(caterpillar, simpledim = 2,
                   x = c(11, 17, 23, 29, 35, 40), cov = TRUE)
plot(cat.sim)



