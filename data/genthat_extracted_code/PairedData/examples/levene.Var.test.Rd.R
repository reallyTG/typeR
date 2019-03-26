library(PairedData)


### Name: levene.Var.test
### Title: Levene test of scale for paired samples
### Aliases: levene.Var.test levene.Var.test.default levene.Var.test.paired
### Keywords: htest

### ** Examples

z<-rnorm(20)
x<-rnorm(20)+z
y<-(rnorm(20)+z)*2
levene.Var.test(x,y)

# Some variations
levene.Var.test(x,y,tr=0.2)
levene.Var.test(x,y,location="median")


data(anscombe2)
p<-with(anscombe2,paired(X2,Y2))
levene.Var.test(p)






