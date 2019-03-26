library(rococo)


### Name: RococoTestResults-class
### Title: Class "RococoTestResults"
### Aliases: RococoTestResults-class RococoTestResults rococotestresults
###   show,RococoTestResults-method
### Keywords: htest classes

### ** Examples

## create data
f <- function(x) ifelse(x > 0.9, x - 0.9, ifelse(x < -0.9, x + 0.9, 0))
x <- rnorm(25)
y <- f(x) + rnorm(25, sd=0.1)

## perform correlation tests
ret <- rococo.test(x, y, similarity="classical", alternative="greater")
show(ret)

ret <- rococo.test(x, y, similarity="linear", alternative="greater")
show(ret)

ret <- rococo.test(x, y, similarity=c("classical", "gauss"),
                   r=c(0, 0.1), alternative="greater",
                   numtests=10000)
show(ret)



