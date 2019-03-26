library(vegtable)


### Name: transform
### Title: Convert cover scales to percent cover.
### Aliases: transform transform,character,coverconvert-method
###   transform,factor,coverconvert-method
###   transform,numeric,coverconvert-method
###   transform,vegtable,missing-method
### Keywords: methods

### ** Examples

library(vegtable)
data(Kenya_veg)

## Check the available scales
summary(Kenya_veg@coverconvert)

## Conversion by default 'top' rule
Kenya_veg <- transform(Kenya_veg, to="percent")
summary(as.factor(Kenya_veg@samples$percent))

## Conversion by 'middle' rule
Kenya_veg <- transform(Kenya_veg, to="percent", rule="middle", replace=TRUE)
summary(as.factor(Kenya_veg@samples$percent))

## Conversion by 'bottom' rule
Kenya_veg <- transform(Kenya_veg, to="percent", rule="bottom", replace=TRUE)
summary(as.factor(Kenya_veg@samples$percent))



