library(flower)


### Name: SI3
### Title: Among-individual synchrony index of Koenig et al. (2003)
### Aliases: SI3
### Keywords: ~flowering ~synchrony ~SI3

### ** Examples

a1=c(0,1,1,1,0,0,0)
a2=c(0,1,0,1,1,0,0)
a3=c(0,0,0,1,1,1,0)
a4=c(1,0,0,1,1,0,1)
a5=c(0,0,1,1,1,0,1)
a6=c(0,0,0,1,1,1,1)
pop=c("pop1","pop1","pop1","pop2","pop2","pop2")
ind=c(1,2,3,1,2,3)
dd=rbind(a1,a2,a3,a4,a5,a6)
colnames(dd)=c("D5/1","D5/2","D5/3","D5/4","D5/5","D5/6","D5/7")
C=SI3(dd,as.matrix(pop),as.matrix(ind))
C



