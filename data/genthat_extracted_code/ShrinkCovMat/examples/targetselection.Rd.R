library(ShrinkCovMat)


### Name: targetselection
### Title: Target Matrix Selection
### Aliases: targetselection

### ** Examples

data(colon)
NormalGroup <- colon[, 1:40]
targetselection(NormalGroup)
## Similar intensities, the range of the sample variances is small 
## and the average is not close to one. The scaled identity matrix 
## seems to be the most suitable target matrix for the normal group

TumorGroup <- colon[, 41:62]
targetselection(TumorGroup)
## Similar intensities, the range of the sample variances is small 
## and the average is not close to one. The scaled identity matrix 
## seems to be the most suitable target matrix for the colon group



