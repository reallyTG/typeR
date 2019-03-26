library(RcmdrMisc)


### Name: DeltaMethod
### Title: Confidence Intervals by the Delta Method
### Aliases: DeltaMethod print.DeltaMethod
### Keywords: models

### ** Examples

if (require(car)){
  DeltaMethod(lm(prestige ~ income + education, data=Duncan), "b1/b2")
  }



