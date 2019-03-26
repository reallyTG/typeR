library(mewAvg)


### Name: mewAccum
### Title: Update the class 'mewTyp'
### Aliases: mewAccum

### ** Examples

n_iter <- 1000

av <- mewInit(n_bin = 4, n_xx = 1, ff = 0.5)

for (i in 1:n_iter) {

  value <- runif(n=2)
  value[1] <- ((cos(value[1]*2*pi))^2)*(1 - exp(-0.01*i))
  value[2] <- (-((sin(value[2]*2*pi))^2))*(1 - exp(-0.01*i))
  value <- as.double(value)

  av <- mewAccum(xx = value, av = av)
}



