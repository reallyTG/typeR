library(VNM)


### Name: VNM-package
### Title: Tools for constructing 3-objective optimal designs
### Aliases: VNM-package
### Keywords: package

### ** Examples

##Find the 3-objective optimal design for the 4PL model
result=MOPT(LB=log(.001), UB=log(1000), P=c(0.137,1.563,.00895,-1.790),lambda=c(1/3,1/3),
delta=-1)

##Generated the 3-objective optimal design
Res.D=summary(result)

##Verification plot of the generated design
plot(result)

dose=Res.D[1,]
weight=Res.D[2,]

##Check D-efficiency of the generated design
Deff(weight, P=c(0.137,1.563,.00895,-1.790), dose, LB=log(.001), UB=log(1000))

##Check c-efficiency of the generated design for estimating the ED50
#ceff1(weight, P=c(0.137,1.563,.00895,-1.790), dose, LB=log(.001), UB=log(1000))

##Check c-efficency of the generated design for estimating the MED
#ceff2(weight, P=c(0.137,1.563,.00895,-1.790), dose, LB=log(.001), UB=log(1000), delta=-1, r=30)



