library(subrank)


### Name: corc
### Title: Function to estimate copula using ranks and sub-sampling
### Aliases: corc

### ** Examples

lon <- 30
a <- 2
x <- rnorm(lon)
y = a*x^2+rnorm(lon)
datatable = as.data.frame(cbind(x,y))
c=corc(datatable,c("x","y"),8)
c
sum(c$cop)



