library(gnm)


### Name: pickCoef
### Title: Get Indices or Values of Selected Model Coefficients
### Aliases: pickCoef
### Keywords: models

### ** Examples

set.seed(1)

### Extract indices for use with ofInterest

## fit the "UNIDIFF" mobility model across education levels
unidiff <- gnm(Freq ~ educ*orig + educ*dest +
               Mult(Exp(educ), orig:dest),
               family = poisson, data = yaish, subset = (dest != 7))

## set coefficients in first constituent multiplier as 'ofInterest'
## using regular expression
ofInterest(unidiff) <- pickCoef(unidiff, "[.]educ")

## summarise model, only showing coefficients of interest
summary(unidiff)

## get contrasts of these coefficients
getContrasts(unidiff, ofInterest(unidiff))

### Extract coefficients to use as starting values

## fit diagonal reference model with constant weights
set.seed(1)

## reconstruct counts voting Labour/non-Labour
count <- with(voting, percentage/100 * total)
yvar <- cbind(count, voting$total - count)

classMobility <- gnm(yvar ~ -1 + Dref(origin, destination), 
                     family = binomial, data = voting)

## create factors indicating movement in and out of salariat (class 1)
upward <- with(voting, origin != 1 & destination == 1)
downward <- with(voting, origin == 1 & destination != 1)

## extract diagonal effects from first model to use as starting values
diagCoef <- pickCoef(classMobility, "Dref(., .)", fixed = TRUE,
                     value = TRUE)

## fit separate weights for the "socially mobile" groups
## -- there are now 3 parameters for each weight
socialMobility <- gnm(yvar ~ -1 + Dref(origin, destination,
                                       delta = ~ 1 + downward + upward),
                      family = binomial, data = voting,
                      start = c(rep(NA, 6), diagCoef))



