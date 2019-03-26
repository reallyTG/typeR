library(DNetFinder)


### Name: DNetGGM
### Title: Testing for the structural difference between two GGMs
### Aliases: DNetGGM
### Keywords: Gaussian graphical model False discovery rate Differential
###   network

### ** Examples

Data1=read.table(system.file("extdata","Data1.txt",package="DNetFinder"),header=FALSE)
Data2=read.table(system.file("extdata","Data2.txt",package="DNetFinder"),header=FALSE)
BetaGGM1=read.table(system.file("extdata","BetaGGM1.txt",package="DNetFinder"),header=FALSE)
BetaGGM2=read.table(system.file("extdata","BetaGGM2.txt",package="DNetFinder"),header=FALSE)
est_DNGGM=DNetGGM(Data1,Data2,BetaGGM1,BetaGGM2,alpha=0.1)



