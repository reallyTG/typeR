library(extraDistr)


### Name: BivPoiss
### Title: Bivariate Poisson distribution
### Aliases: BivPoiss dbvpois rbvpois
### Keywords: distribution

### ** Examples


x <- rbvpois(5000, 7, 8, 5)
image(prop.table(table(x[,1], x[,2])))
colMeans(x)




