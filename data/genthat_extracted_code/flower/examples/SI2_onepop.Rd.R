library(flower)


### Name: SI2_onepop
### Title: Flowering synchrony index of Augspurger (1983) in a polulation
### Aliases: SI2_onepop
### Keywords: ~flowering ~synchrony ~SI2_onepop

### ** Examples

a1=c(0,1,1,1,0,0,0)
a2=c(0,1,0,1,1,0,0)
a3=c(0,0,0,1,1,1,0)
a4=c(0,0,0,1,1,0,1)
ind=c("1","1","2","2")
dd=rbind(a1,a2,a3,a4)
colnames(dd)=c("D5/1","D5/2","D5/3","D5/4","D5/5","D5/6","D5/7")
C=SI2_onepop(dd,ind)
C



