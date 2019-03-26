library(mRMRe)


### Name: correlate
### Title: Function to compute various correlation measures between two
###   variables
### Aliases: correlate
### Keywords: univar

### ** Examples

set.thread.count(2)

## load data
data(cgps)
   
## spearman correlation coefficent between the first gene and Camptothecin IC50
correlate(X=cgps.ge[ ,1], Y=cgps.ic50, method="spearman")
   
## concordance index between the first gene and Camptothecin IC50
correlate(X=cgps.ge[ ,1], Y=cgps.ic50, method="cindex")



