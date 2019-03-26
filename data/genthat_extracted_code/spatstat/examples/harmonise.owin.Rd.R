library(spatstat)


### Name: harmonise.owin
### Title: Make Windows Compatible
### Aliases: harmonise.owin harmonize.owin
### Keywords: spatial manip

### ** Examples

   harmonise(X=letterR,
             Y=grow.rectangle(Frame(letterR), 0.2),
             Z=as.mask(letterR, eps=0.1),
             V=as.mask(letterR, eps=0.07))



