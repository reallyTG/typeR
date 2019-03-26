library(desiR)


### Name: d.low
### Title: Low values are desirable
### Aliases: d.low

### ** Examples

set.seed(1)
x <- rnorm(1000, mean=100, sd =5) # generate data
d <- d.low(x, cut1=90, cut2=110, scale=1)

# plot data
hist(x, breaks=30)
# add line
des.line(x, "d.low", des.args=c(cut1=90, cut2=110, scale=1))

hist(x, breaks=30)
des.line(x, "d.low", des.args=c(cut1=90, cut2=110, des.min=0.1,
des.max=0.95, scale=1.5))



