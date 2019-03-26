library(crrSC)


### Name: crrc
### Title: Competing Risks Regression for Clustered Data
### Aliases: crrc
### Keywords: survival

### ** Examples

#library(cmprsk)
#crr(ftime=cdata$ftime, fstatus=cdata$fstatus, cov1=cdata$z)
# Simulated clustered data set
data(cdata)
crrc(ftime=cdata[,1],fstatus=cdata[,2], 
cov1=cdata[,3], 
cluster=cdata[,4])



