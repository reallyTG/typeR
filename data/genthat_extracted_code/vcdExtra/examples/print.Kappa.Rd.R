library(vcdExtra)


### Name: print.Kappa
### Title: Print Kappa
### Aliases: print.Kappa
### Keywords: htest category

### ** Examples

data("SexualFun")
Kappa(SexualFun)
print(Kappa(SexualFun), CI=TRUE)

# stratified 3-way table
apply(MSPatients, 3, Kappa)



