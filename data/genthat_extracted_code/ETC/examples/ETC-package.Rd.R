library(ETC)


### Name: ETC-package
### Title: Equivalence to control
### Aliases: ETC-package ETC
### Keywords: package

### ** Examples

data(BW)

comp <- etc.diff(formula=Weight~Dose, data=BW, margin.up=30, method="Bofinger")
summary(comp)



