library(mrMLM)


### Name: pLARmEB
### Title: To perform GWAS with pLARmEB method
### Aliases: pLARmEB

### ** Examples

G1=data(Gen)
P1=data(Phe)
Readraw=ReadData(fileGen=Gen,filePhe=Phe,fileKin=NULL,filePS =NULL,
Genformat=1)
InputData=inputData(readraw=Readraw,Genformat=1,method="pLARmEB",trait=1)
result=pLARmEB(InputData$doMR$gen,InputData$doMR$phe,InputData$doMR$outATCG,
InputData$doMR$genRaw,InputData$doMR$kk,InputData$doMR$psmatrix,
CriLOD=3,lars1=50,Genformat=1,Bootstrap=FALSE,CLO=1)   



