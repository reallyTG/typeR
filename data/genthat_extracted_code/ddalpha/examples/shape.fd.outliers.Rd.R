library(ddalpha)


### Name: shape.fd.outliers
### Title: Functional Depth-Based Shape Outlier Detection
### Aliases: shape.fd.outliers
### Keywords: depth functional outlier

### ** Examples

n = 30
dataf = dataf.population()$dataf[1:n]
shape.fd.outliers(dataf,print=TRUE,plotpairs=TRUE,
identifiers=unlist(dataf.population()$identifier)[1:n])




