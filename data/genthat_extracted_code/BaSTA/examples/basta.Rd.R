library(BaSTA)


### Name: basta
### Title: Parametric Bayesian estimation of age-specific survival for
###   left-truncated and right-censored capture-recapture/recovery data.
### Aliases: basta basta.default
### Keywords: methods

### ** Examples

## Load data:
data("sim1", package = "BaSTA")

## Check data consistency:
new.dat  <- DataCheck(sim1, studyStart = 51, studyEnd = 70, autofix = rep(1,7))

## Run short version of BaSTA on the data:
out <- basta(sim1, studyStart = 51, studyEnd = 70, niter = 200, burnin = 11, 
             thinning = 10, updateJumps = FALSE)

## Print results:
summary(out, digits = 3)

## Plot traces for survival parameters:
plot(out)

## Plot traces for proportional hazards parameter:
plot(out, trace.name = "gamma")

## Plot survival and mortality curves:
plot(out, plot.trace = FALSE)



