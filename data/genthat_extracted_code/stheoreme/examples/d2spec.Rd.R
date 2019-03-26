library(stheoreme)


### Name: d2spec
### Title: Power Spectrum Probability Vector Calculator for Matrices
### Aliases: d2spec

### ** Examples

# compare (harmonic+background) with (harmonic noisy period) matrices
s0<-array(2+sin(c(1:256)/3), c(16,16))
s1<-array(sin(c(1:512)+runif(512,0,2)), c(16,32))

# as radial:
b<-d2spec(d2arr0=s0, d2arr1=s1); b
b<-d2spec(s0, s1, brks=29, band=c(0.15,0.5)); b
# as angular:
b<-d2spec(s0, s1, method='ang', meansub=FALSE); b

#example of 3-step data analysis with Klimontovich's S-theorem
# Study two gratings: random vs regular
s0<-array(c(rep(0,640),rep(1,640)), c(320,320))
s1<-array(runif(5120,0,1), c(64,80))
# step a. Binarize (to make s1 comparable with s0 by its nature as a grating)
a<-utild2bin(s0, s1, method='med')
# step b. Create probability vectors as for angular space (anisotropy study)
# There is no doubt s0 is more regular
b<-d2spec(a$bin0, a$bin1, brks=36, method='ang90'); b
# step c. Compare gratings with Klimontovich's S-theorem. Renormalized entropy shift
# is negligible compared to Shannon's. Evolution from state0 to state1 is possible
# but clearly with external entropy (or energy) inflow
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)



