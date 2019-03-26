library(PairedData)


### Name: imam.Var.test
### Title: Imam test of scale for paired samples
### Aliases: imam.Var.test imam.Var.test.default imam.Var.test.paired
### Keywords: htest

### ** Examples

z<-rnorm(20)
x<-rnorm(20)+z
y<-(rnorm(20)+z)*2
imam.Var.test(x,y)

# some variations
imam.Var.test(x,y,tr=0.2)
imam.Var.test(x,y,location="median")

data(anscombe2)
p<-with(anscombe2,paired(X1,Y1))
imam.Var.test(p)



