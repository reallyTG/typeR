library(stheoreme)


### Name: d2nat.d1nat
### Title: Probability Mass Function Calculator for Matrices
### Aliases: d2nat.d1nat

### ** Examples

#two modelling arrays: random with randomness distorted by power
s0<-array(runif(256,0,1)^2, c(16,16))
s1<-array(runif(512,0,1)^3, c(16,8))

b<-d2nat.d1nat(d2arr0=s0,d2arr1=s1); b
b<-d2nat.d1nat(s0,s1,brks=256); b
b<-d2nat.d1nat(s0,s1,brks=18,band=c(0.1,0.5),method='rows'); b

#example of 3-step data analysis with Klimontovich's S-theorem
# step a. Split matrices to regions with radius 1, create new matrices 
# of region means 
a<-utild2group(s0, s1, radius=1)
# step b. Create probability vectors
b<-d1nat(a$group0,a$group1,brks=8,band=c(0.1,0.8))
# step c. Compare samples with Klimontovich's S-theorem
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)



