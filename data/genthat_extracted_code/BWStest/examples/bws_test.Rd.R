library(BWStest)


### Name: bws_test
### Title: Perform the Baumgartner-Weiss-Schindler hypothesis test.
### Aliases: bws_test
### Keywords: htest

### ** Examples


# under the null
set.seed(123)
x <- rnorm(100)
y <- rnorm(100)
hval <- bws_test(x,y)

# under the alternative
set.seed(123)
x <- rnorm(100)
y <- rnorm(100,mean=1.0)
hval <- bws_test(x,y)
show(hval)
stopifnot(hval$p.value < 0.05)

# under the alternative with a one sided test.
set.seed(123)
x <- rnorm(100)
y <- rnorm(100,mean=0.7)
hval <- bws_test(x,y,alternative='less')
show(hval)
stopifnot(hval$p.value < 0.01)

hval <- bws_test(x,y,alternative='greater')
stopifnot(hval$p.value > 0.99)

hval <- bws_test(x,y,alternative='two.sided')
stopifnot(hval$p.value < 0.05)




