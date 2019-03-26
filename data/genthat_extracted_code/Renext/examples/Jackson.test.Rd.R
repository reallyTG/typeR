library(Renext)


### Name: Jackson.test
### Title: Jackson's test of exponentiality
### Aliases: Jackson.test

### ** Examples

set.seed(1234)
x <- rGPD(n = 50, loc = 0, scale = 1, shape = 0.1)
Jackson.test(x, method = "num")$p.value
Jackson.test(x, method = "asymp")$p.value
Jackson.test(x, method = "sim")$p.value



