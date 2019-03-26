library(HistDAWass)


### Name: rQQ
### Title: Method 'rQQ'
### Aliases: rQQ rQQ,distributionH,distributionH-method
###   rQQ,distributionH-method

### ** Examples


##---- initialize two distributionH object mydist1 and mydist2
 mydist1<-distributionH(x=c(1,2,3),p=c(0, 0.4, 1))
 mydist2<-distributionH(x=c(7,8,10,15),p=c(0, 0.2, 0.7, 1))
 ## computes the rQQ
 rQQ(mydist1,mydist2)
 ## OUTPUT 0.916894




