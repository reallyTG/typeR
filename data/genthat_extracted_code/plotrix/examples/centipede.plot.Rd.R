library(plotrix)


### Name: centipede.plot
### Title: Display a centipede plot
### Aliases: centipede.plot
### Keywords: misc

### ** Examples

 testcp<-list("",40)
 for(i in 1:40) testcp[[i]]<-rnorm(sample(1:8,1)*50)
 segs<-get.segs(testcp)
 centipede.plot(segs,main="Test centipede plot",vgrid=0)
 # now leave out the number of valid observations, pass x labels and no right labels
 centipede.plot(segs[1:3,],main="Test centipede plot",vgrid=0,mar=c(4,5,3,2),
  left.labels=paste("X",1:40,sep=""),right.labels=rep("",40))



