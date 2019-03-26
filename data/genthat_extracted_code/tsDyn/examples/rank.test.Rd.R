library(tsDyn)


### Name: rank.test
### Title: Test of the cointegrating rank
### Aliases: rank.test summary.rank.test print.rank.test summary.rank.test
### Keywords: ts

### ** Examples



data(barry)

## estimate the VECM with Johansen! 
ve <- VECM(barry, lag=1, estim="ML")

## specific test:
ve_test_spec <- rank.test(ve, r_null=1)
ve_test_spec_tr <- rank.test(ve, r_null=1, type="trace")

ve_test_spec
ve_test_spec_tr

## No specific test: automatic method
ve_test_unspec <- rank.test(ve)
ve_test_unspec_tr <- rank.test(ve, type="trace")

ve_test_unspec
ve_test_unspec_tr

## summary method: output will be same for all types/test procedure:
summary(ve_test_unspec_tr)

## The function works for many specification of the VECM(), try:
rank.test(VECM(barry, lag=3, estim="ML"))
rank.test(VECM(barry, lag=3, include="both",estim="ML"))
rank.test(VECM(barry, lag=3, LRinclude="const",estim="ML"))

## Note that the tests are simple likelihood ratio, and hence can be obtained also manually:
-2*(logLik(ve, r=1)-logLik(ve, r=2)) # eigen test, 1 against 2
-2*(logLik(ve, r=1)-logLik(ve, r=3)) # eigen test, 1 against 3




