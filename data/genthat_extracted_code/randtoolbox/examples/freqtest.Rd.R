library(randtoolbox)


### Name: freq.test
### Title: the Frequency test
### Aliases: freq.test
### Keywords: htest

### ** Examples

# (1) 
#
freq.test(runif(1000))
print( freq.test( runif(1000000), echo=FALSE) )

# (2) 
#
freq.test(runif(1000), 1:4)

freq.test(runif(1000), 10:40)




