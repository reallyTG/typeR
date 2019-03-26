library(flower)


### Name: RIpop
### Title: Flowering phenology index of Mahoro (2002) at poplulation level
### Aliases: RIpop
### Keywords: ~flowering ~phenology ~RIpop

### ** Examples

a1=c(0,1,1,1,0,0,0)
a2=c(0,1,0,1,1,0,0)
a3=c(0,0,0,1,1,1,0)
a4=c(0,0,0,1,1,0,1)
pop=c("pop1","pop1","pop2","pop2")
ind=c(1,2,1,2)
dd=rbind(a1,a2,a3,a4)
colnames(dd)=c("D5/1","D5/2","D5/3","D5/4","D5/5","D5/6","D5/7")
C=RIpop(dd,pop,ind)
C



