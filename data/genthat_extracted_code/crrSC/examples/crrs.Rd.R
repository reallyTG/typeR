library(crrSC)


### Name: crrs
### Title: Competing Risks Regression for Stratified Data
### Aliases: crrs
### Keywords: survival

### ** Examples

##
#using fine and gray model
#crr(ftime=center$ftime, fstatus=center$fstatus, 
#cov1=cbind(center$fm,center$cells))
#
# High Stratification: ctype=2
# Random sub-sample 
data(center)
cov.test<-cbind(center$fm,center$cells)
crrs(ftime=center[,1],fstatus=center[,2],
cov1=cov.test,
strata=center$id,ctype=2)




