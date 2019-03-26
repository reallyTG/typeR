library(PairedData)


### Name: grambsch.Var.test
### Title: Grambsch test of scale for paired samples
### Aliases: grambsch.Var.test grambsch.Var.test.default
###   grambsch.Var.test.paired
### Keywords: htest

### ** Examples

z<-rnorm(20)
x<-rnorm(20)+z
y<-(rnorm(20)+z)*2
grambsch.Var.test(x,y)

p<-paired(x,y)
grambsch.Var.test(p)



