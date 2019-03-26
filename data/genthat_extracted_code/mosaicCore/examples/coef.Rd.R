library(mosaicCore)


### Name: coef.function
### Title: Extract coefficients from a function
### Aliases: coef.function coef

### ** Examples

if (require(mosaicData)) {
  model <- lm( width ~ length, data = KidsFeet)
  f <- makeFun( model )
  coef(f)
}



