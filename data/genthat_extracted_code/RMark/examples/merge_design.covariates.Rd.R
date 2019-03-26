library(RMark)


### Name: merge_design.covariates
### Title: Merge time (occasion) and/or group specific covariates into
###   design data
### Aliases: merge_design.covariates merge.design.covariates
### Keywords: utility

### ** Examples


data(dipper)
dipper.proc=process.data(dipper)
ddl=make.design.data(dipper.proc)
df=data.frame(time=c(1:7),effort=c(10,5,2,8,1,2,3))
# note that the value for time 1 is superfluous for CJS but not for POPAN
# the value 10 will not appear in the summary because there is no p for time 1
summary(ddl$p)
ddl$p=merge_design.covariates(ddl$p,df)
summary(ddl$p)
## No test: 
# This example is excluded from testing to reduce package check time
#
# Assign group-specific values
#
dipper.proc=process.data(dipper,groups="sex")
dipper.ddl=make.design.data(dipper.proc)
df=data.frame(group=c(rep("Female",6),rep("Male",6)),time=rep(c(2:7),2),
  effort=c(10,5,2,8,1,2,3,20,10,4,16,2))
merge_design.covariates(dipper.ddl$p,df,bygroup=TRUE)
## End(No test)



