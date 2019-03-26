library(DNetFinder)


### Name: DNetNPN
### Title: Testing for the structural difference between two NPNGMs
### Aliases: DNetNPN
### Keywords: Nonparanormal graphical model False discovery rate
###   Differential network

### ** Examples

Data1=read.table(system.file("extdata","Data1.txt",package="DNetFinder"),header=FALSE)
Data2=read.table(system.file("extdata","Data2.txt",package="DNetFinder"),header=FALSE)
BetaNPN1=read.table(system.file("extdata","BetaNPN1.txt",package="DNetFinder"),header=FALSE)
BetaNPN2=read.table(system.file("extdata","BetaNPN2.txt",package="DNetFinder"),header=FALSE)
est_DNNPN=DNetNPN(Data1,Data2,BetaNPN1,BetaNPN2,alpha=0.1)



