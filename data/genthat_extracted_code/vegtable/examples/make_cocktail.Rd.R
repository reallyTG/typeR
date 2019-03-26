library(vegtable)


### Name: make_cocktail
### Title: Produce a Cocktail classification.
### Aliases: make_cocktail make_cocktail,shaker,vegtable-method

### ** Examples

library(vegtable)

## Example from Alvarez (2017)
data(Wetlands)

Wetlands_veg@header <- make_cocktail(Wetlands, Wetlands_veg, cover="percen")
summary(as.factor(Wetlands_veg@header$Syntax))

## Same but only for two vegetation units
data(Wetlands)
Wetlands_veg@header <- make_cocktail(Wetlands, Wetlands_veg,
	which=c("HY1","HY2"), cover="percen")
summary(as.factor(Wetlands_veg@header$Syntax))



