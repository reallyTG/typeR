library(CPAT)


### Name: andrews_test_reg
### Title: Multivariate Andrews' Test for End-of-Sample Structural Change
### Aliases: andrews_test_reg

### ** Examples

x <- rnorm(1000)
y <- 1 + 2 * x + rnorm(1000)
df <- data.frame(x, y)
CPAT:::andrews_test_reg(y ~ x, data = df, M = 900)



