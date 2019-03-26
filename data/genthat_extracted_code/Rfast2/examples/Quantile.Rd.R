library(Rfast2)


### Name: Sample quantiles and col/row wise quantiles
### Title: Sample quantiles and col/row wise quantiles
### Aliases: Quantile colQuantile rowQuantile
### Keywords: Sample Quantiles and col - row wise Quantiles

### ** Examples

x<-rnorm(1000)
probs<-runif(10)
sum( quantile(x, probs = probs) - Quantile(x, probs) )



