library(mrMLM)


### Name: pKWmEB
### Title: To perform GWAS with pKWmEB method
### Aliases: pKWmEB

### ** Examples

G1=data(Gen)
P1=data(Phe)
Readraw=ReadData(fileGen=Gen,filePhe=Phe,fileKin=NULL,filePS =NULL,
Genformat=1)
InputData=inputData(readraw=Readraw,Genformat=1,method="pKWmEB",trait=1)
result=pKWmEB(InputData$doMR$gen,InputData$doMR$phe,InputData$doMR$outATCG,
InputData$doMR$genRaw,InputData$doMR$kk,InputData$doMR$psmatrix,
0.05,svmlod=3,Genformat=1,CLO=1)  



