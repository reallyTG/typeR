library(SAFD)


### Name: defuzzify
### Title: Defuzzification
### Aliases: defuzzify
### Keywords: manip datagen

### ** Examples

#Example:
data(XX)
V<-translator(XX[[3]],50)
V2<-V
V2$x<-V$x/20
SS<-vector("list",length=150)
for (j in 1:150){
 SS[[j]]<-generator(V2,)
 }
a<-defuzzify(SS)
a



