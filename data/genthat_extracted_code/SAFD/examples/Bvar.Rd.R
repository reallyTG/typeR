library(SAFD)


### Name: Bvar
### Title: (Sample) Variance
### Aliases: Bvar
### Keywords: manip univar

### ** Examples

#Example 1:
data(XX)
X<-translator(XX[[1]],50)
Y<-translator(XX[[2]],50)
Z<-translator(XX[[3]],50)
YY<-list(X,Y,Z)
A<-Bvar(YY,1)
A

#Example 2:
data(XX)
v<-Bvar(list(XX[[1]],XX[[1]]),1/3)
v

#Example 3:
data(Trees)
Species1_Var<-Bvar(Trees$species1,1/3)
Species1_Var
Species2_Var<-Bvar(Trees$species2,1/3)
Species2_Var
Species3_Var<-Bvar(Trees$species3,1/3)
Species3_Var



