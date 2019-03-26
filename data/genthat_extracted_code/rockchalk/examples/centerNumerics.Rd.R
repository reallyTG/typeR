library(rockchalk)


### Name: centerNumerics
### Title: Find numeric columns, center them, re-name them, and join them
###   with the original data.
### Aliases: centerNumerics

### ** Examples

set.seed(12345)
dat <- data.frame(x1=rnorm(100, m = 50), x2 = rnorm(100, m = 50),
    x3 = rnorm(100, m = 50), y = rnorm(100),
    x4 = gl(2, 50, labels = c("Male","Female")))
datc1 <- centerNumerics(dat)
head(datc1)
summarize(datc1)
datc2 <- centerNumerics(dat, center=c("x1", "x2"))
head(datc2)
summarize(datc2)
attributes(datc2)
datc3 <- centerNumerics(dat, center = c("x1" = 30, "x2" = 40))
head(datc3)
summarize(datc3)
attributes(datc3)
datc4 <- centerNumerics(dat, center=c("x1", "x2"), standardize = TRUE)
head(datc3)
summarize(datc4)
attributes(datc4)
datc5 <- centerNumerics(dat, center=c("x1"=30, "x2"=40),
standardize = c("x2" = 5, "x1" = 7))
head(datc5)
summarize(datc5)
attributes(datc5)



