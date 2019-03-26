library(gee)


### Name: gee
### Title: Function to solve a Generalized Estimation Equation Model
### Aliases: gee print.gee summary.gee print.summary.gee
### Keywords: nonlinear

### ** Examples

data(warpbreaks)
## marginal analysis of random effects model for wool
summary(gee(breaks ~ tension, id=wool, data=warpbreaks, corstr="exchangeable"))
## test for serial correlation in blocks
summary(gee(breaks ~ tension, id=wool, data=warpbreaks, corstr="AR-M", Mv=1))

if(require(MASS)) {
data(OME)
## not fully appropriate link for these data.
(fm <- gee(cbind(Correct, Trials-Correct) ~ Loud + Age + OME, id = ID,
           data = OME, family = binomial, corstr = "exchangeable"))
summary(fm)
}


