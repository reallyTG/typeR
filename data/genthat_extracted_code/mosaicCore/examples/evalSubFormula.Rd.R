library(mosaicCore)


### Name: evalSubFormula
### Title: Evaluate a part of a formula
### Aliases: evalSubFormula

### ** Examples

if (require(mosaicData)) {
data(CPS85)
cps <- CPS85[1:6,]
cps
evalSubFormula( rhs( ~ married & sector), data=cps )
}



