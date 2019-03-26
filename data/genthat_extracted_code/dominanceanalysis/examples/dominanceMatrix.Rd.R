library(dominanceanalysis)


### Name: dominanceMatrix
### Title: Retrieve or calculates a dominance matrix for a given object
### Aliases: dominanceMatrix dominanceMatrix.data.frame
###   dominanceMatrix.matrix dominanceMatrix.dominanceAnalysis

### ** Examples

# For matrix or data.frame
mm<-data.frame(a=c(5,3,2),b=c(4,2,1),c=c(5,4,3))
dominanceMatrix(mm)
# For dominanceAnalysis
data(longley)
da.longley<-dominanceAnalysis(lm(Employed~.,longley))
dominanceMatrix(da.longley,type="complete")



