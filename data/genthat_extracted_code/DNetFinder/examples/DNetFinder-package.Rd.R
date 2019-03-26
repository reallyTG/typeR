library(DNetFinder)


### Name: DNetFinder-package
### Title: Estimating Differential Networks under Semiparametric Gaussian
###   Graphical Models
### Aliases: DNetFinder-package DNetFinder
### Keywords: Differential network Nonparanormal graphical model False
###   discovery rate control

### ** Examples

library(flare)
library(DNetFinder)
Data1=read.table(system.file("extdata","Data1.txt",package="DNetFinder"),header=FALSE)
Data2=read.table(system.file("extdata","Data2.txt",package="DNetFinder"),header=FALSE)
BetaGGM1=read.table(system.file("extdata","BetaGGM1.txt",package="DNetFinder"),header=FALSE)
BetaGGM2=read.table(system.file("extdata","BetaGGM2.txt",package="DNetFinder"),header=FALSE)
BetaNPN1=read.table(system.file("extdata","BetaNPN1.txt",package="DNetFinder"),header=FALSE)
BetaNPN2=read.table(system.file("extdata","BetaNPN2.txt",package="DNetFinder"),header=FALSE)
est_coefGGM=lassoGGM(Data1)
est_coefNPN=lassoNPN(Data1)
est_DNGGM=DNetGGM(Data1,Data2,BetaGGM1,BetaGGM2,alpha=0.1)
est_DNNPN=DNetNPN(Data1,Data2,BetaNPN1,BetaNPN2,alpha=0.1)



