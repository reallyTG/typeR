library(LIStest)


### Name: lis.test
### Title: Test for independence between paired samples
### Aliases: lis.test
### Keywords: ~longest increasing subsequence ~copula

### ** Examples

# Example 1
# mixture of two bivariate normal, one with correlation 0.9 
# and the other with correlation -0.9 

N <-100
ro<- 0.90
Z1<-rnorm(N)
Z2<-rnorm(N)
X2<-X1<-Z1
I<-(1:floor(N*0.5))
I2<-((floor(N*0.5)+1):N)
X1[I]<-Z1[I]
X2[I]<-(Z1[I]*ro+Z2[I]*sqrt(1-ro*ro))
X1[I2]<-Z1[I2]
X2[I2]<-(Z1[I2]*(-ro)+Z2[I2]*sqrt(1-ro*ro))
plot(X1,X2)
# calculate the p.value using the default settings (method="JLMn" 
# and alternative="two.sided")
lis.test(X1,X2)
# calculate the p.value using method="JLn" and 
# alternative="two.sided".
lis.test(X1,X2,method="JLn")
#
# Example 2: see subsection 4.3.2-Application 2 from main reference.
# (It requires the package VGAM) 
#
#require(VGAM)
#plot(coalminers$BW, coalminers$nBW)
#lis.test(coalminers$BW, coalminers$nBW, 
#alternative = "greater", method = "Ln")
#lis.test(coalminers$BW, coalminers$nBW, 
#alternative = "greater", method = "JLn")
#



