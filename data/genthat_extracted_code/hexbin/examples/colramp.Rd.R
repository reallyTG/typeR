library(hexbin)


### Name: ColorRamps
### Title: Color Ramps on Perceptually Linear Scales
### Aliases: ColorRamps LinGray BTC BTY LinOCS heat.ob magent plinrain
### Keywords: color

### ** Examples

h <- hexbin(rnorm(10000),rnorm(10000))
plot(h, colramp= BTY)
## looks better if you shave the tails:
plot(h, colramp= function(n){LinOCS(n,beg=15,end=225)})



