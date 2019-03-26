library(PBSmodelling)


### Name: lucent
### Title: Convert Solid Colours to Translucence
### Aliases: lucent
### Keywords: color

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  pbsfun = function(clrs=c("moccasin",rainbow(3))){
    clrs = c(clrs,lucent(clrs,a=0.25))
    testCol(clrs); invisible() }
  pbsfun()
  par(oldpar)
})



