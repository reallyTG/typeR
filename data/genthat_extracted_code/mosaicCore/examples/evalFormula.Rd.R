library(mosaicCore)


### Name: evalFormula
### Title: Evaluate a formula
### Aliases: evalFormula

### ** Examples

if (require(mosaicData)) {
data(CPS85)
cps <- CPS85[1:6,]
cps
evalFormula(wage ~ sex & married & age | sector & race, data=cps)
}



