library(mosaicCore)


### Name: modelVars
### Title: extract predictor variables from a model
### Aliases: modelVars

### ** Examples

if (require(mosaicData)) {
  model <- lm( wage ~ poly(exper, degree = 2), data = CPS85 )
  modelVars(model)
}



