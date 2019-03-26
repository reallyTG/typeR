library(stheoreme)


### Name: d1spec
### Title: Power Spectrum Probability Vector Calculator
### Aliases: d1spec

### ** Examples

s0 <- 2+sin(c(1:128))
s1<- array(c(rep(0,8),rep(1,8)), c(256))

b<-d1spec(sample0=s0,sample1=s1); b
b<-d1spec(s0, s1, band=c(0,0.25), brks=16, meansub=FALSE); b

#example of 3-step data analysis with Klimontovich's S-theorem
# step a. Clean samples from outliers (points out of 1.4 sigmas)
a<-utild1clean(s0, s1, method='both', nsigma=1.4)
# step b. Create probability vectors. It seems that s0 has lower level
# of orderliness (Shannon entropy is higher).
b<-d1spec(a$clean0,a$clean1); b
# step c. Compare samples with Klimontovich's S-theorem. Renormalized entropy indicates 
# the opposite: s0 is more ordered and difference in Shannon entropy values was 
# due to just "thermodynamic noise" (discretization noise in this case)
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)




