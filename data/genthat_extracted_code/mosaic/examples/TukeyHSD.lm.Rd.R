library(mosaic)


### Name: TukeyHSD.lm
### Title: Additional interfaces to TukeyHSD
### Aliases: TukeyHSD.lm TukeyHSD.formula

### ** Examples

## These should all give the same results
if (require(mosaicData)) {
  model <- lm(age ~ substance, data=HELPrct)
  TukeyHSD(model)
  TukeyHSD( age ~ substance, data=HELPrct)
  TukeyHSD(aov(age ~ substance, data=HELPrct))
}



