library(surveillance)


### Name: twinstim_step
### Title: Stepwise Model Selection by AIC
### Aliases: stepComponent add1.twinstim drop1.twinstim
### Keywords: models methods

### ** Examples

data("imdepi", "imdepifit")

## simple baseline model
m0 <- update(imdepifit, epidemic=~1, siaf=NULL)

## AIC-based step-wise backward selection of the endemic component
m0_step <- stepComponent(m0, "endemic", scope=list(lower=~I(start/365-3.5)))
## nothing is dropped from the model

## Don't show: 
m0_step$anova <- NULL
stopifnot(identical(m0, m0_step))
## End(Don't show)



