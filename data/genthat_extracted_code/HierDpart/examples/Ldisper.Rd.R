library(HierDpart)


### Name: Ldisper
### Title: Test significance of dispersion among subaggregate within
###   aggregate
### Aliases: Ldisper

### ** Examples

f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
region1=paste("region",rep(1,time=6))
region2=paste("region",rep(2,time=6))
region3=paste("region",rep(3,time=2))
region4=paste("region",rep(4,time=2))

level1=data.frame(matrix(data=0,nrow=16,ncol=1))
level1[1:6,1]=region1
level1[7:12,1]=region2
level1[13:14,1]=region3
level1[15:16,1]=region4
colnames(level1)=c("region")

ldis=Ldisper(infile,ncode=3,group=level1$region)
ldis$dispersion
ldis$pertestdis



