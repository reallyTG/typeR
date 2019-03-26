library(multicon)


### Name: yuenContrast
### Title: Generalized Yuen's T-tests
### Aliases: yuenContrast yuenContrast.default yuenContrast.formula
### Keywords: t test contrast robust yuen

### ** Examples

dv <- c(rnorm(30, mean=1, sd=2), rnorm(20))
iv <- c(rep(1,30),rep(2,20))

  # Student's t-test (assuming equal variances)
t.test(dv ~ iv, var.equal=TRUE)
  # Welch's t-test (not assuming equal variance)
t.test(dv ~ iv, var.equal=FALSE)
  # Yuen's t-test with 20% trimming assuming equal variances
yuenContrast(iv, dv, EQVAR=TRUE)
  # Yuen's t-test with 20% trimming not assuming equal variances
yuenContrast(iv, dv, EQVAR=FALSE)
  # Same as Student's t-test using yuenContrast
yuenContrast(iv, dv, EQVAR=TRUE, tr=0)
  # Same as Welch's t-test using yuenContrast
yuenContrast(iv, dv, EQVAR=FALSE, tr=0)

  # Contrast with 3 Groups
dv <- c(rnorm(30), rnorm(20, mean=-.5), rnorm(10, mean=-1))
iv <- c(rep("c",30), rep("b", 20), rep("a", 10))
    # With no trimming (t-contrast with Welch-Sattertwaite DFs)
yuenContrast(iv, dv, wgt=c(1, 0, -1), tr=0)
    # With 20% trimming
yuenContrast(iv, dv, wgt=c(1, 0, -1), tr=.2)
    # With the formula method
yuenContrast(dv ~ iv, wgt = c(1, 0, -1))





