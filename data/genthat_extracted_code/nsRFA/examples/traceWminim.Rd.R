library(nsRFA)


### Name: traceWminim
### Title: Cluster analysis: disjoint regions
### Aliases: traceWminim sumtraceW nearest
### Keywords: cluster

### ** Examples

data(hydroSIMN)
parameters
summary(parameters)

# traceWminim
param <- parameters[c("Hm","Ybar")]
n <- dim(param)[1]; k <- dim(param)[2]
param.norm <- (param - matrix(apply(param,2,mean),nrow=n,ncol=k,
               byrow=TRUE))/matrix(apply(param,2,sd),
               nrow=n,ncol=k,byrow=TRUE)
clusters <- traceWminim(param.norm,4); 
names(clusters) <- parameters["cod"][,]
clusters

annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]

fac <- factor(annualflows["cod"][,],
              levels=names(clusters[clusters==1]))
x1 <- annualflows[!is.na(fac),"dato"]
cod1 <- annualflows[!is.na(fac),"cod"]
#HW.tests(x1,cod1)          # it takes some time

fac <- factor(annualflows["cod"][,],
              levels=names(clusters[clusters==3]))
x3 <- annualflows[!is.na(fac),"dato"]
cod3 <- annualflows[!is.na(fac),"cod"]
#HW.tests(x3,cod3)          # it takes some time



