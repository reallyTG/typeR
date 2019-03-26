library(ADPF)


### Name: ADPF
### Title: Adaptive Degree Polynomial Filter [ADPF]
### Aliases: ADPF

### ** Examples


ADPF::CHROM

smooth<-ADPF(CHROM[,6],0,9,13)
numpoints=length(CHROM[,6])
plot(x=1:numpoints,y=CHROM[,6]);lines(x=1:numpoints, y=smooth[,3])



