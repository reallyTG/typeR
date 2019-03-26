library(PairedData)


### Name: sandvikolsson.Var.test
### Title: Sandvik-Olsson test of scale for paired samples
### Aliases: sandvikolsson.Var.test sandvikolsson.Var.test.default
###   sandvikolsson.Var.test.paired
### Keywords: htest

### ** Examples

z<-rnorm(20)
x<-rnorm(20)+z
y<-(rnorm(20)+z)*2
sandvikolsson.Var.test(x,y)

p<-paired(x,y)
sandvikolsson.Var.test(p)


# some variations
sandvikolsson.Var.test(p,tr=0.2)
sandvikolsson.Var.test(p,location="median")




