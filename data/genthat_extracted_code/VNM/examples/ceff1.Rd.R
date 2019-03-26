library(VNM)


### Name: ceff1
### Title: Checking c-efficiency for estimating the ED50.
### Aliases: ceff1

### ** Examples

##The given design
dose=c(-6.91,-4.89,-4.18,6.91)
weight=c(.344,.323,.162,.171)

##Model parameter values for the 4PL
par.4PL=c(0.137,1.563,.00895,-1.790)

##Check c-efficiency of the given design for estimating the ED50 and its verification plot
Res.c1=ceff1(weight, P=par.4PL, dose, LB=log(.001), UB=log(1000))
summary(Res.c1)
plot(Res.c1)



