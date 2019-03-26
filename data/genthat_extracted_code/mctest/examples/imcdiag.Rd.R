library(mctest)


### Name: imcdiag
### Title: Individual Multicollinearity Diagnostic Measures
### Aliases: imcdiag
### Keywords: VIF CVIF TOL Farrar F-test F-test and R-Square relation
###   klein's Rule Leamer's Method

### ** Examples

## Hald Cement data
data(Hald)
x<-Hald[,-1]
y<-Hald[,1]

## all Individual measures
id<-imcdiag(x, y); id$idiags[,1]

# VIF measure with custom VIF threshold
imcdiag(x, y, method = "VIF", vif = 5)

# CVIF measure with custom CVIF threshold and correlation matrix
imcdiag(x, y, method = "CVIF", cvif = 5, corr = TRUE)

# Collinearity Diagnostic measures in matrix of 0 or 1
imcdiag(x, y, all = TRUE)
imcdiag(x, y, method = "VIF", all = TRUE)

## only VIF values without collinearity detection indication
imcdiag(x,y, method="VIF")[[1]][,1]
plot(imcdiag(x,y, method="VIF")[[1]][,1]) # vif plot



