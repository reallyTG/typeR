library(flower)


### Name: flower-package
### Title: Tools for characterizing flowering traits
### Aliases: flower flower
### Keywords: flower

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
#the flowering synchrony index
R0=SI(dd,pop)
R0
R1=SI2_onepop(dd,as.matrix(ind))
R1
R2=SI2(dd,as.matrix(pop),as.matrix(ind))
R2
R3=SI3(dd,as.matrix(pop),as.matrix(ind))
R3
R4=SI4(dd,as.matrix(pop),as.matrix(ind))
R4
#the rank order of flowering 
R5=RIind(dd,pop,ind)
R5
#the pulsed flowering phenology
R6=fCV(dd,pop)
R6



