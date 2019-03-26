library(stheoreme)


### Name: d1nat
### Title: Probability Mass Function Calculator
### Aliases: d1nat

### ** Examples


#two modelling arrays: random with randomness distorted by power
s0<-runif(128,0,1)^2
s1<-runif(64,0,1)^2.3

b<-d1nat(sample0=s0,sample1=s1); b
b<-d1nat(s0,s1,brks=12,band=c(0.2,1)); b
   
#example of 3-step data analysis with Klimontovich's S-theorem
# step a. Convert samples to arrays of sequential 17-point means
a<-utild1group(s0, s1, radius=8, method='splitN')
# step b. Create probability vectors
b<-d1nat(a$group0,a$group1,brks=12,band=c(0,0.8)); b
# step c. Compare samples with Klimontovich's S-theorem
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)




