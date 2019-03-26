library(surveillance)


### Name: twinstim_update
### Title: 'update'-method for '"twinstim"'
### Aliases: update.twinstim
### Keywords: models methods

### ** Examples

data("imdepi", "imdepifit")

## add another epidemic covariate
## (but fix siaf-parameter so that this example runs quickly)
imdepifit2 <- update(imdepifit, epidemic = ~. + log(popdensity),
                     optim.args = list(fixed="e.siaf.1"))

## compare by AIC
AIC(imdepifit, imdepifit2)



