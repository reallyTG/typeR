library(fishmethods)


### Name: growthTraject
### Title: Plot growth trajectories obtained from tagging data
### Aliases: growthTraject
### Keywords: ~kwd1 ~kwd2

### ** Examples

 data(bonito)
 temp<-bonito[c(bonito$T2-bonito$T1)>0,]
 growthTraject(0.19,97.5,lentag=temp$L1, lenrec=temp$L2,timelib=c(temp$T2-temp$T1))



