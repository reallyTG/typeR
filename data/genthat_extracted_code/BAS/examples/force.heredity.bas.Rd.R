library(BAS)


### Name: force.heredity.bas
### Title: Post processing function to force constraints on interaction
###   inclusion bas BMA objects
### Aliases: force.heredity.bas
### Keywords: regression

### ** Examples


data("chickwts")
bas.chk <- bas.lm(weight ~ feed, data = chickwts)
#  summary(bas.chk)  # 2^5 = 32 models
bas.chk.int <- force.heredity.bas(bas.chk)
#  summary(bas.chk.int)  # two models now


data(Hald)
bas.hald <- bas.lm(Y ~ .^2, data = Hald)
bas.hald.int <- force.heredity.bas(bas.hald)
image(bas.hald.int)

image(bas.hald.int)

# two-way interactions
data(ToothGrowth)
ToothGrowth$dose <- factor(ToothGrowth$dose)
levels(ToothGrowth$dose) <- c("Low", "Medium", "High")
TG.bas <- bas.lm(len ~ supp * dose, data = ToothGrowth, modelprior = uniform())
TG.bas.int <- force.heredity.bas(TG.bas)
image(TG.bas.int)



