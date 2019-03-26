library(PairedData)


### Name: Tobacco
### Title: Tobacco data from Snedecor and Cochran (1967)
### Aliases: Tobacco
### Keywords: datasets

### ** Examples

data(Tobacco)

# A clear outlier
with(Tobacco,plot(paired(Preparation_1,Preparation_2)))


# Comparison of normal and robust tests
with(Tobacco,t.test(paired(Preparation_1,Preparation_2)))
with(Tobacco,yuen.t.test(paired(Preparation_1,Preparation_2)))

with(Tobacco,Var.test(paired(Preparation_1,Preparation_2)))
with(Tobacco,grambsch.Var.test(paired(Preparation_1,Preparation_2)))

with(Tobacco,cor.test(Preparation_1,Preparation_2))
with(Tobacco,winsor.cor.test(Preparation_1,Preparation_2))

# Maybe a transformation
require(MASS)
with(Tobacco,eqscplot(log(Preparation_1),log(Preparation_2)))
abline(0,1,col="red")



