library(MTS)


### Name: FEVdec
### Title: Forecast Error Variance Decomposition
### Aliases: FEVdec

### ** Examples

p1=matrix(c(0.2,-0.6,0.3,1.1),2,2)
theta1=matrix(c(-0.5,0,0,-0.6),2,2)
Sig=matrix(c(3,1,1,1),2,2)
m1=FEVdec(p1,theta1,Sig)
names(m1)



