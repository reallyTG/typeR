library(spatstat)


### Name: fitted.mppm
### Title: Fitted Conditional Intensity for Multiple Point Process Model
### Aliases: fitted.mppm
### Keywords: spatial models

### ** Examples

   model <- mppm(Bugs ~ x, data=hyperframe(Bugs=waterstriders),
                           interaction=Strauss(7))
   cifs <- fitted(model)



