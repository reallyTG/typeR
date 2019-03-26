library(randtoolbox)


### Name: order.test
### Title: the Order test
### Aliases: order.test
### Keywords: htest

### ** Examples

# (1) mersenne twister vs torus
#
order.test(runif(6000))
order.test(torus(6000))

# (2) 
#
order.test(runif(4000), 4)
order.test(torus(4000), 4)

# (3) 
#
order.test(runif(5000), 5)
order.test(torus(5000), 5)





