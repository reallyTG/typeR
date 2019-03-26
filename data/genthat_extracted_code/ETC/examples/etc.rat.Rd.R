library(ETC)


### Name: etc.rat
### Title: Simultaneous equivalence to control for ratios of means
### Aliases: etc.rat
### Keywords: htest

### ** Examples

data(BW)

comp <- etc.rat(formula=Weight~Dose, data=BW, margin.up=1.25, method="var.equal")
summary(comp)



