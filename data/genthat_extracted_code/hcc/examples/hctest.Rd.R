library(hcc)


### Name: hctest
### Title: Test for hidden correlation with one input
### Aliases: hctest
### Keywords: models htest

### ** Examples

#Example 1
#in this example, there is no hidden correlation
set.seed(313477)
n <- 50
err <- rnorm(n)
x <- rnorm(n)
y <- 1+2*x+err
res <- resid(lm(y~x))
hctest(x, res)



