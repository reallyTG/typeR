library(hexbin)


### Name: NHANES
### Title: NHANES Data : National Health and Nutrition Examination Survey
### Aliases: NHANES
### Keywords: datasets

### ** Examples

data(NHANES)
summary(NHANES)
## Missing Data overview :
nNA <- sapply(NHANES, function(x)sum(is.na(x)))
cbind(nNA[nNA > 0])
# Which are just these 6 :
## Not run: 
##D Diet.Iron         141
##D Albumin           252
##D Serum.Iron       1008
##D TIBC              853
##D Transferin       1019
##D Hemoglobin        759
## End(Not run)



