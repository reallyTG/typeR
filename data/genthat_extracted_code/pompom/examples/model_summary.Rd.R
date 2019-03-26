library(pompom)


### Name: model_summary
### Title: Provide model summary.
### Aliases: model_summary

### ** Examples

## Don't show: 
mdl <- model_summary(model.fit = usemmodelfit,
                     var.number = 3,
                     lag.order = 1)
mdl$beta
mdl$beta.se
mdl$psi
mdl$cfi
mdl$tli
mdl$rmsea
mdl$srmr
## End(Don't show)
## No test: 
mdl <- model_summary(model.fit = usemmodelfit,
                     var.number = 3,
                     lag.order = 1)
mdl$beta
mdl$beta.se
mdl$psi
mdl$cfi
mdl$tli
mdl$rmsea
mdl$srmr
## End(No test)




