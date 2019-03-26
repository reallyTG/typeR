library(mlogit)


### Name: scoretest
### Title: The three tests for mlogit models
### Aliases: scoretest scoretest.mlogit scoretest.default waldtest.mlogit
###   waldtest lrtest.mlogit lrtest
### Keywords: htest

### ** Examples

library("mlogit")
data("TravelMode", package = "AER")
ml <- mlogit(choice ~ wait + travel + vcost, TravelMode,
             shape = "long", chid.var = "individual", alt.var = "mode")
hl <- mlogit(choice ~ wait + travel + vcost, TravelMode,
             shape = "long", chid.var = "individual", alt.var = "mode",
             method = "bfgs", heterosc = TRUE)
lrtest(ml, hl)
waldtest(hl)
scoretest(ml, heterosc = TRUE)



