library(psychotools)


### Name: personpar
### Title: Extract Person Parameters of Item Response Models
### Aliases: personpar personpar.raschmodel personpar.rsmodel
###   personpar.pcmodel personpar.plmodel personpar.gpcmodel coef.personpar
###   print.personpar vcov.personpar
### Keywords: classes

### ** Examples

o <- options(digits = 4)

## load verbal aggression data
data("VerbalAggression", package = "psychotools")

## fit a Rasch model to dichotomized verbal aggression data and
ram <- raschmodel(VerbalAggression$resp2)

## extract person parameters
## (= parameters of the underlying ability distribution)
rap <- personpar(ram)
rap

## extract variance-covariance matrix and standard errors
vc <- vcov(rap)
sqrt(diag(vc))

## Wald confidence intervals
confint(rap)

## now match each person to person parameter with the corresponding raw score
personpar(ram, personwise = TRUE)[1:6]

## person parameters for RSM/PCM fitted to original polytomous data
rsm <- rsmodel(VerbalAggression$resp)
pcm <- pcmodel(VerbalAggression$resp)
cbind(personpar(rsm, vcov = FALSE), personpar(pcm, vcov = FALSE))

if(requireNamespace("mirt")) {
## fit a 2PL accounting for gender impact and
twoplm <- plmodel(VerbalAggression$resp2, impact = VerbalAggression$gender)

## extract the person parameters
## (= mean/variance parameters from the normal ability distribution)
twoplp <- personpar(twoplm)
twoplp

## extract the standard errors
sqrt(diag(vcov(twoplp)))

## Wald confidence intervals
confint(twoplp)

## now look at the individual person parameters
## (integrated out over the normal ability distribution)
personpar(twoplm, personwise = TRUE)[1:6]
}

options(digits = o$digits)



