library(LPKsample)


### Name: LP.comean
### Title: Function to find LP-comeans
### Aliases: LP.comean
### Keywords: GLP other functions

### ** Examples

#example: LP-comean for two simple vectors:
 y<-c(1,2,3,4,5)
 z<-c(0,-1,-1,3,4)
 comeanYZ=LP.comean(y,z)
#sum square statistics of LP comean:
 comeanYZ$LPINFOR
#p-value:
 comeanYZ$p.val
#comean matrix:
 comeanYZ$LP.matrix



