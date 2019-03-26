library(SAFD)


### Name: btestk.mean
### Title: Multi-sample bootstrap test for the equality of the mean of FRVs
### Aliases: btestk.mean
### Keywords: htest univar

### ** Examples

#Example 1: very small B only for testing purpose
data(Trees)
sel<-c(1,2,3)
b<-btestk.mean(Trees,sel,B=5)
b

#Example 2: run for bigger B
#b<-btestk.mean(Trees,sel,100)
#b



