library(fishmethods)


### Name: growthResid
### Title: Plot residuals of growth model fitted to tag data
### Aliases: growthResid
### Keywords: ~kwd1 ~kwd2

### ** Examples

 data(bonito)
 temp<-bonito[c(bonito$T2-bonito$T1)>0,]
 growthResid(0.19,97.5,lentag=temp$L1, lenrec=temp$L2,timelib=c(temp$T2-temp$T1),graph=1)



