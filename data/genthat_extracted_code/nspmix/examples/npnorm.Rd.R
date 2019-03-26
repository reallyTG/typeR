library(nspmix)


### Name: npnorm
### Title: Class 'npnorm'
### Aliases: npnorm rnpnorm plot.npnorm
### Keywords: class function

### ** Examples

mix = disc(pt=c(0,4), pr=c(0.3,0.7))
x = rnpnorm(200, mix$pt, mix$pr, sd=1)
plot(x, mix, beta=1)




