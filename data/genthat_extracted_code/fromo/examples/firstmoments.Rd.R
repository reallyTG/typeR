library(fromo)


### Name: sd3
### Title: Compute first K moments
### Aliases: sd3 skew4 kurt5 cent_moments std_moments cent_cumulants
###   std_cumulants

### ** Examples

x <- rnorm(1e5)
sd3(x)[1] - sd(x)
skew4(x)[4] - length(x)
skew4(x)[3] - mean(x)
skew4(x)[2] - sd(x)
if (require(moments)) {
  skew4(x)[1] - skewness(x)
}


# check 'robustness'; only the mean should change:
kurt5(x + 1e12) - kurt5(x)
# check speed
if (require(microbenchmark) && require(moments)) {
  dumbk <- function(x) { c(kurtosis(x) - 3.0,skewness(x),sd(x),mean(x),length(x)) }
  set.seed(1234)
  x <- rnorm(1e6)
  print(kurt5(x) - dumbk(x))
  microbenchmark(dumbk(x),kurt5(x),times=10L)
}
y <- std_moments(x,6)
cml <- cent_cumulants(x,6)
std <- std_cumulants(x,6)

# check that skew matches moments::skewness
if (require(moments)) {
    set.seed(1234)
    x <- rnorm(1000)
    resu <- fromo::skew4(x)

    msku <- moments::skewness(x)
    stopifnot(abs(msku - resu[1]) < 1e-14)
}

# check skew vs e1071 skewness, which has a different denominator
if (require(e1071)) {
    set.seed(1234)
    x <- rnorm(1000)
    resu <- fromo::skew4(x)

    esku <- e1071::skewness(x,type=3)
    nobs <- resu[4]
    stopifnot(abs(esku - resu[1] * ((nobs-1)/nobs)^(3/2)) < 1e-14)

    # similarly:
    resu <- fromo::std_moments(x,max_order=3,used_df=0)
    stopifnot(abs(esku - resu[1] * ((nobs-1)/nobs)^(3/2)) < 1e-14)
}




