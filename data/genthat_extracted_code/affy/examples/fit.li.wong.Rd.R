library(affy)


### Name: fit.li.wong
### Title: Fit Li and Wong Model to a Probe Set
### Aliases: fit.li.wong li.wong
### Keywords: manip models

### ** Examples

    x <- sweep(matrix(2^rnorm(600),30,20),1,seq(1,2,len=30),FUN="+")
    fit1 <- fit.li.wong(x)
    plot(x[1,])
    lines(fit1$theta)



