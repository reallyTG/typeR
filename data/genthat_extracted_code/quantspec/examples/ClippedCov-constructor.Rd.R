library(quantspec)


### Name: ClippedCov-constructor
### Title: Create an instance of the 'ClippedCov' class.
### Aliases: ClippedCov-constructor clippedCov
### Keywords: Constructors

### ** Examples

ccf <- clippedCov(rnorm(200), maxLag = 25, levels.1 = c(0.1,0.5,0.9))
dim(getValues(ccf))
#print values for levels (.5,.5)
plot(ccf, maxLag = 20)



