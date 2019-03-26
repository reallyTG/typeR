library(mrMLM)


### Name: FASTmrEMMA
### Title: To perform GWAS with FASTmrEMMA method
### Aliases: FASTmrEMMA

### ** Examples

G1=data(Gen)
P1=data(Phe)
Readraw=ReadData(fileGen=Gen,filePhe=Phe,fileKin=NULL,filePS =NULL,
Genformat=1)
InputData=inputData(readraw=Readraw,Genformat=1,method="FASTmrEMMA",trait=1)
result=FASTmrEMMA(InputData$doFME$gen,InputData$doFME$phe,
InputData$doFME$outATCG,InputData$doFME$genRaw,
InputData$doFME$kk,InputData$doFME$psmatrix,0.005,
svmlod=3,Genformat=1,Likelihood="REML",CLO=1)   



