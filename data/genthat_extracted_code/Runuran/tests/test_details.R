
#############################################################################
##                                                                         ##
##   Tests for unuran.details                                              ##
##                                                                         ##
#############################################################################

## --- Test Parameters ------------------------------------------------------

SEED <- 123456

## --- Load library ---------------------------------------------------------

library(Runuran)

## --- Auxiliary functions --------------------------------------------------

print.details <- function(distr, method) {
    set.seed(SEED)
    unr <- unuran.new(distr, method)
    print(unuran.details(unr,show=TRUE, return.list=FALSE))
    print(unuran.details(unr,show=FALSE,return.list=TRUE))
    print(unuran.details(unr,show=FALSE,debug=TRUE))
}

## --- Discrete distributions -----------------------------------------------

## DARI
print.details("binomial(20,0.5)", "dari")

## DAU
print.details("binomial(20,0.5)", "dau")

## DGT
print.details("binomial(20,0.5)", "dgt")

## DSROU
print.details("binomial(20,0.5)", "dsrou")

## DSS
print.details("binomial(20,0.5)", "dss")

## DSTD
print.details("binomial(20,0.5)", "dstd")

## --- Continuous distributions ---------------------------------------------

## AROU
print.details("normal(1,2)", "arou")

## ARS
print.details("normal(1,2)", "ars")

## CSTD
print.details("normal(1,2)", "cstd")

## HINV
print.details("normal(1,2)", "hinv")

## HRB
## print.details("normal(1,2)", "hrb")

## HRD
## print.details("normal(1,2)", "hrd")

## HRI
## print.details("normal(1,2)", "hri")

## ITDR
print.details("gamma(0.5)", "itdr")

## NINV
print.details("normal(1,2)", "ninv")

## NROU
print.details("normal(1,2)", "nrou")

## PINV
print.details("normal(1,2)", "pinv")

## SROU
print.details("normal(1,2)", "srou")

## SSR
print.details("normal(1,2)", "ssr")

## TABL
print.details("normal(1,2)", "tabl")

## TDR
print.details("normal(1,2)", "tdr")

## UTDR
print.details("normal(1,2)", "utdr")

## MIXT

## --- Continuous Multivariate distributions --------------------------------

## --- End ------------------------------------------------------------------

detach("package:Runuran",unload = TRUE)

## --------------------------------------------------------------------------
