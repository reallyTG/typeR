library(mrMLM)


### Name: DoData
### Title: process raw data
### Aliases: DoData

### ** Examples

G1=data(Gen)
P1=data(Phe)
readraw=ReadData(fileGen=Gen,filePhe=Phe,fileKin=NULL,filePS =NULL,
Genformat=1)
result=DoData(readraw$genRaw,Genformat=3,readraw$pheRaw1q,readraw$kkRaw,
readraw$psmatrixRaw,trait=1,type=2)



