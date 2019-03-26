library(multicon)


### Name: tContrast
### Title: Constrast T-tests
### Aliases: tContrast tContrast.default tContrast.formula
### Keywords: t test contrast

### ** Examples

dv <- c(rnorm(30, mean=1, sd=2), rnorm(20))
iv <- c(rep(1,30),rep(2,20))

  # Student's t-test (assuming equal variances)
t.test(dv ~ iv, var.equal=TRUE)
  # Welch's t-test (not assuming equal variance)
t.test(dv ~ iv, var.equal=FALSE)
  # tContrast assuming equal variances
tContrast(iv, dv, EQVAR=TRUE)
  # tContrast not assuming equal variances
tContrast(iv, dv, EQVAR=FALSE)

  # Contrast with 3 Groups
dv <- c(rnorm(30), rnorm(20, mean=-.5), rnorm(10, mean=-1))
iv <- c(rep("c",30), rep("b", 20), rep("a", 10))
    # t-contrast with Welch-Sattertwaite DFs
tContrast(iv, dv, wgt=c(1, 0, -1))
    # Compare with yuenContrast with no trimming
yuenContrast(iv, dv, wgt=c(1, 0, -1), tr=0)
    # With the formula method
yuenContrast(dv ~ iv, wgt = c(1, 0, -1))





