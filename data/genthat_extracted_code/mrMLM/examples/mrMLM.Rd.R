library(mrMLM)


### Name: mrMLM
### Title: Multi-Locus Random-SNP-Effect Mixed Linear Model Tools for
###   Genome-Wide Association Study
### Aliases: mrMLM mrMLM
### Keywords: R mrMLM package

### ** Examples

G1=data(Gen)
P1=data(Phe)
mrMLM(fileGen=Gen,filePhe=Phe,fileKin=NULL,filePS=NULL,Genformat="Num",
method=c("ISIS EM-BLASSO"),Likelihood="REML",trait=1:1,SearchRadius=20,
CriLOD=3,SelectVariable=50,Bootstrap=FALSE,
DrawPlot=FALSE,Plotformat="jpeg",Resolution="Low",dir=tempdir())



