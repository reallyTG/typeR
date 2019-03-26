library(agricolae)


### Name: wilt
### Title: Data of Bacterial Wilt (AUDPC) and soil
### Aliases: wilt
### Keywords: datasets

### ** Examples

library(agricolae)
data(wilt)
days<-c(7,11,15,19,23,27,31,35,39,43,47,51)
AUDPC<-audpc(wilt[,-1],days)
relative<-audpc(wilt[,-1],days,type="relative")




