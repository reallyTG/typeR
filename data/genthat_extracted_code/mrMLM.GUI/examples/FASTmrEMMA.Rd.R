library(mrMLM.GUI)


### Name: FASTmrEMMA
### Title: To perform GWAS with FASTmrEMMA method
### Aliases: FASTmrEMMA

### ** Examples

G1=data(fmegen)
P1=data(mrphe)
G2=data(fmegenraw)
result=FASTmrEMMA(fmegen,mrphe,outATCG=NULL,fmegenraw,kk=NULL,psmatrix=NULL,
0.005,3,1,Likelihood="REML",CLO=1)



