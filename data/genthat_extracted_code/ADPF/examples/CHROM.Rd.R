library(ADPF)


### Name: CHROM
### Title: Data frame of Chromatogram values
### Aliases: CHROM
### Keywords: datasets

### ** Examples

 ADPF::CHROM

smooth<-ADPF(CHROM[,6],0,9,13)
numpoints=length(CHROM[,6])
plot(x=1:numpoints,y=CHROM[,6]);lines(x=1:numpoints, y=smooth[,3])



