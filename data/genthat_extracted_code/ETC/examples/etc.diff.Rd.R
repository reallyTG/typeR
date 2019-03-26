library(ETC)


### Name: etc.diff
### Title: Simultaneous equivalence to control for differences of means
### Aliases: etc.diff
### Keywords: htest

### ** Examples

data(BW)

comp <- etc.diff(formula=Weight~Dose, data=BW, margin.up=30, method="Bofinger")
summary(comp)



