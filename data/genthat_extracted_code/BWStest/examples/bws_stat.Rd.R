library(BWStest)


### Name: bws_stat
### Title: Compute the test statistic of the Baumgartner-Weiss-Schindler
###   test.
### Aliases: bws_stat

### ** Examples


set.seed(1234)
x <- runif(1000)
y <- runif(100)
bval <- bws_stat(x,y)
# check a monotonic transform:
ftrans <- function(x) { log(1 + x) }
bval2 <- bws_stat(ftrans(x),ftrans(y))
stopifnot(all.equal(bval,bval2))
# check commutivity
bval3 <- bws_stat(y,x)
stopifnot(all.equal(bval,bval3))




