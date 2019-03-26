library(car)


### Name: poTest
### Title: Test for Proportional Odds in the Proportional-Odds
###   Logistic-Regression Model
### Aliases: poTest poTest.polr print.poTest
### Keywords: models htest

### ** Examples

if (require("MASS")){
    .W <- Womenlf
    .W$partic <- factor(.W$partic, levels=c("not.work", "parttime", "fulltime"))
    poTest(polr(partic ~ hincome + children + region, data=.W))
}



