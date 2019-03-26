library(SNPmaxsel)


### Name: Fasymp
### Title: Asymptotical distribution of the maximally selected chi-square
###   statistic
### Aliases: Fasymp
### Keywords: htest

### ** Examples

# load SNPmaxsel library
# library(SNPmaxsel)

Fasymp(t=2,a.vec=c(0.2,0.1,0.05,0.05,0.6),type="ord")
Fasymp(t=2,a.vec=c(0.2,0.1,0.05,0.05,0.6),type="all.pairs")
Fasymp(t=2,a.vec=c(0.2,0.1,0.05,0.05,0.6),type="all.partitions")

Fasymp(t=2,a.vec=c(0.2,0.1,0.1,0.1,0.05,0.05,0.05,0.05,0.3),type="inter.ord")
Fasymp(t=2,a.vec=c(0.2,0.1,0.1,0.1,0.05,0.05,0.05,0.05,0.3),type="inter.cat")

# Creating a user-defined groups list 
# (correponding to type)="ord" with K=5)
my.groups<-list(list(group1=1,group2=2:5),list(group1=1:2,group2=3:5),
list(group1=1:3,group2=4:5),list(group1=1:4,group2=5))

Fasymp(t=2,a.vec=c(0.2,0.1,0.05,0.05,0.6),type=NULL,groups=my.groups)



