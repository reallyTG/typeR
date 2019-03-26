library(mrMLM)


### Name: inputData
### Title: Input data which have been transformed
### Aliases: inputData

### ** Examples

G1=data(Gen)
P1=data(Phe)
Readraw=ReadData(fileGen=Gen,filePhe=Phe,fileKin=NULL,filePS =NULL,
Genformat=1)
result=inputData(readraw=Readraw,Genformat=3,method="mrMLM",trait=1)



