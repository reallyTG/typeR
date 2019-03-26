library(mets)


### Name: familyclusterWithProbands.index
### Title: Finds all pairs within a cluster (famly) with the proband
###   (case/control)
### Aliases: familyclusterWithProbands.index

### ** Examples

i<-c(1,1,2,2,1,3)
p<-c(1,0,0,1,0,1)
d<- familyclusterWithProbands.index(i,p)
print(d)



