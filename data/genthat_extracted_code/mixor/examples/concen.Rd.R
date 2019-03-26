library(mixor)


### Name: concen
### Title: Twins Trouble Concentrating Data
### Aliases: concen
### Keywords: datasets

### ** Examples

library("mixor")
data("concen")
# sort the data by twin pair ID
concen<-concen[order(concen$ID),]
# common ICC probit model
Common.ICC<-mixor(TConcen~Mz, data=concen, id=ID, weights=freq, 
     link="probit", nAGQ=10, random.effect.mean=FALSE)
summary(Common.ICC)
# Varying ICC probit model
Varying.ICC<-mixor(TConcen~Mz+Dz, data=concen, id=ID, weights=freq, 
    which.random.slope=1:2, exclude.fixed.effect=2, link="probit", 
    nAGQ=20, random.effect.mean=FALSE, UNID=1)
summary(Varying.ICC)



