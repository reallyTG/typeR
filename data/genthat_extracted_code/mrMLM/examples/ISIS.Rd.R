library(mrMLM)


### Name: ISIS
### Title: To perform GWAS with ISIS EM-BLASSO method
### Aliases: ISIS

### ** Examples

G1=data(Gen)
P1=data(Phe)
Readraw=ReadData(fileGen=Gen,filePhe=Phe,fileKin=NULL,filePS =NULL,
Genformat=1)
InputData=inputData(readraw=Readraw,Genformat=1,method="ISIS EM-BLASSO",
trait=1)
result=ISIS(InputData$doMR$gen,InputData$doMR$phe,InputData$doMR$outATCG,
InputData$doMR$genRaw,InputData$doMR$kk,InputData$doMR$psmatrix,
0.01,svmlod=3,Genformat=1,CLO=1) 



