library(mccmeiv)


### Name: matcdatamult
### Title: A sample dataset representing matched case control data. Similar
###   to matcdata except with multiple
###   stratification/instrumental/miscellaneous variables.
### Aliases: matcdatamult
### Keywords: Mismeasured Matched Cased Control Instrumental Dataset bias

### ** Examples

data(matcdatamult)
out=with(matcdatamult,meivm3(y=y, sv=sv1,xs=xs1, w=w,z=cbind(z1,z2)))



