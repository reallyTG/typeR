library(cwhmisc)


### Name: FinneyCorr
### Title: Finney's correction to log normally distributed data, r-squared
###   and standard deviation of a linear model.
### Aliases: FinneyCorr FC.lm R2.lm s.lm summaryFs
### Keywords: models regression

### ** Examples

FinneyCorr(0.346274,24+3)  #  1.059306936

ok <- RNGkind()
RNGkind(kind = "default", normal.kind = "default")
set.seed(2009, kind = "default")
x <- rnorm(1000); y <- 0.1*rnorm(1000)
## Reset:
RNGkind(ok[1])

lmo <- lm(y ~ x)
FC.lm(lmo)  # 1.00472
R2.lm(lmo)  # 6.1926e-05
s.lm(lmo)   # 0.0970954



