library(mhde)


### Name: mhde.test
### Title: Minimum Hellinger Distance Test for Normality
### Aliases: mhde.test

### ** Examples

## example with a normal data set
mhde.test(rnorm(20,0.0,1.0),Small=TRUE)

## example with a uniform data set including example plot
MyList <- mhde.test(runif(25,min=2,max=4))
mhde.plot(MyList)



