library(rt.test)


### Name: Robustified-t-test
### Title: Robustified t-test
### Aliases: rt.test

### ** Examples

# For robustified t-test (two-sided) using median and MAD (TA).
#    test.stat="TA" (default)
x = rnorm(10) 
rt.test(x)

# For robustified t-test (two-sided) using Hodges-Lehmann and Shamos (TB).
x = rnorm(10)
rt.test(x, test.stat="TB")

# 90% CI (two sides).
x = rnorm(10)
rt.test(x, conf.level=0.9)

# 90% CI (one side).
x = rnorm(10)
rt.test(x, alternative="less", conf.level=0.9)




