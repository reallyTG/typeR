library(adagio)


### Name: Testfunctions
### Title: Optimization Test Functions
### Aliases: fnRosenbrock grRosenbrock fnRastrigin grRastrigin fnNesterov
###   grNesterov fnNesterov1 fnHald grHald fnShor grShor
### Keywords: testfunctions

### ** Examples

x <- runif(5)
fnHald(x); grHald(x)

# Compare analytical and numerical gradient
shor_gr <- function(x) adagio:::ns.grad(fnShor, x)    # internal gradient
grShor(x); shor_gr(x) 



