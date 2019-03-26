library(stheoreme)


### Name: cxds.stheorem
### Title: Renormalized Entropy Shift Estimation
### Aliases: cxds.stheorem

### ** Examples

#quazi-gaussian probability vectors with equal means & different variances
f0 <- c(0.0,0.1,0.4,0.4,0.1,0.0)
f1 <- c(0.1,0.15,0.25,0.25,0.15,0.1)
cxds.stheorem(distribution0=f0, distribution1=f1)

#quazi-gaussian bin counts with shift between means
h0 <- c(2,2,17,6,1,1,1,0)
h1 <- c(2,3,5,7,7,4,1,0)
crit.stheorem(h0, h1)
cxds.stheorem(h0, h1)

#example of 2-step analysis with Klimontovich's S-theorem for 2 
# arrays of outcomes {s0,s1}:
s0<-rep(c(1:11,2),256)
s1<-rep(c(2,3,3,4,5,5,5),55)
# step a. Create probability vectors
b<-d1nat(s0,s1,brks=12); b
# step b. Compare samples with Klimontovich's S-theorem
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)

#example of 3-step analysis with Klimontovich's S-theorem to study two gratings
# random vs regular
s0<-array(c(rep(0,640),rep(1,640)), c(320,320))
s1<-array(runif(5120,0,1), c(64,80))
# step a. Binarize (to make s1 comparable with s0 by its nature as a grating)
a<-utild2bin(s0, s1, method='med')
# step b. Create probability vectors as for angular space (anisotropy study)
# There is no doubt s0 is more regular
b<-d2spec(s0, s1, brks=36, method='ang90'); b
# step c. Compare gratings with Klimontovich's S-theorem. Renormalized entropy shift
# is negligible compared to Shannon's. Evolution from state0 to state1 is possible
# but clearly with external entropy (or energy) inflow
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)

#example of 2-step analysis with Klimontovich's S-theorem for
#two following char arrays:
s0<-c("a","b",rep("c",9),rep("d",2),"e","f","g",rep("h",2),"i","j"); s0
s1<-c(rep("a",16), rep("c",35), rep("i",13)); s1
# step a. Create probability vectors. It seems that s0 has lower level
# of orderliness (Shannon entropy is higher)
b<-d1char.d1nat(s0,s1); b
# step b. Compare samples with Klimontovich's S-theorem. Renormalized entropy indicates 
# the opposite: s0 is more ordered and difference in Shannon entropy values was 
# due to just "thermodynamic noise"
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)

#example of 3-step analysis with Klimontovich's S-theorem for 2 random 
# arrays of outcomes  {s0,s1}:
s0<-runif(128,0,1)^2
s1<-runif(64,0,1)^2.3
# step a. Convert samples to arrays of sequential 17-point means
a<-utild1group(s0, s1, radius=8, method='splitN')
# step b. Create probability vectors
b<-d1nat(a$group0,a$group1,brks=12,band=c(0,0.8)); b
# step c. Compare samples with Klimontovich's S-theorem
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)



