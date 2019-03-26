library(PairedData)


### Name: bonettseier.Var.test
### Title: Bonett-Seier test of scale for paired samples
### Aliases: bonettseier.Var.test bonettseier.Var.test.default
###   bonettseier.Var.test.paired
### Keywords: htest

### ** Examples

z<-rnorm(20)
x<-rnorm(20)+z
y<-(rnorm(20)+z)*2
bonettseier.Var.test(x,y)

data(anscombe2)
p<-with(anscombe2,paired(X1,Y1))
bonettseier.Var.test(p)



