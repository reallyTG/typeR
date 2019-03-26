library(subrank)


### Name: desscoptous
### Title: Discrete copula graph, ALL two-dimensional projections
### Aliases: desscoptous

### ** Examples

lon <- 31
a <- 2.85
x <- rnorm(lon)
y = a*x^2+rnorm(lon)
z = rnorm(lon)
tablo = as.data.frame(cbind(x,y,z))
c=corc(tablo,c("x","y","z"),8)
desscoptous(c)



