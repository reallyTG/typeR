library(agricolae)


### Name: PBIB.test
### Title: Analysis of the Partially Balanced Incomplete Block Design
### Aliases: PBIB.test
### Keywords: models

### ** Examples

require(agricolae)
# alpha design 
Genotype<-c(paste("gen0",1:9,sep=""),paste("gen",10:30,sep=""))
ntr<-length(Genotype)
r<-2
k<-3
s<-10
obs<-ntr*r
b <- s*r
book<-design.alpha(Genotype,k,r,seed=5)
book$book[,3]<- gl(20,3)
dbook<-book$book
# dataset
yield<-c(5,2,7,6,4,9,7,6,7,9,6,2,1,1,3,2,4,6,7,9,8,7,6,4,3,2,2,1,1,2,
     1,1,2,4,5,6,7,8,6,5,4,3,1,1,2,5,4,2,7,6,6,5,6,4,5,7,6,5,5,4)
rm(Genotype)
# not run
# analysis
# require(nlme) # method = REML or LM in PBIB.test and require(MASS) method=VC
model <- with(dbook,PBIB.test(block, Genotype, replication, yield, k=3, method="VC"))
# model$ANOVA
# plot(model,las=2)



