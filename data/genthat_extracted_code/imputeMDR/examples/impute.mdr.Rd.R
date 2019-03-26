library(imputeMDR)


### Name: impute.mdr
### Title: The Multifactor Dimensionality Reduction (MDR) Analysis for
###   Imcomplete Data
### Aliases: impute.mdr mdr MDR 'multifactor dimensionality reduction'
### Keywords: nonparametric

### ** Examples

## sample data with missing values
data(incomplete)
## analysis example of 2nd order gene-gene interaction test
impute.mdr(incomplete, colresp=1, cs=1, combi=2, cv.fold = 10,na.method=2)



