library(PairedData)


### Name: mcculloch.Var.test
### Title: McCulloch test of scale for paired samples
### Aliases: mcculloch.Var.test mcculloch.Var.test.default
###   mcculloch.Var.test.paired
### Keywords: htest

### ** Examples

z<-rnorm(20)
x<-rnorm(20)+z
y<-(rnorm(20)+z)*2
mcculloch.Var.test(x,y)

p<-paired(x,y)
mcculloch.Var.test(p)

# A variation with kendall tau
mcculloch.Var.test(p,method="kendall")

# equivalence with the PitmanMorgan test
mcculloch.Var.test(p,method="pearson")
Var.test(p)





