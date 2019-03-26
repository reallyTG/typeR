library(GenoScan)


### Name: GenoScan.SingleWindow
### Title: Test the association between an quantitative/dichotomous outcome
###   variable and a single window by dispersion or burden test allowing
###   for multiple functional annotation scores.
### Aliases: GenoScan.SingleWindow
### Keywords: single window scan

### ** Examples

## GenoScan.prelim does the preliminary data management.
# Input: Y, X (covariates)
## GenoScan.Region scans a region.
# Input: G (genetic variants), pos (position) Z (weights) and result of GenoScan.prelim

library(GenoScan)

# Load data example
# Y: outcomes, n by 1 matrix where n is the total number of observations
# X: covariates, n by d matrix
# G: genotype matrix, n by p matrix where n is the total number of subjects
# pos: positions of genetic variants, p dimention vector
# Z: functional annotation matrix, p by q matrix

data(GenoScan.example)
Y<-GenoScan.example$Y;X<-GenoScan.example$X
G<-GenoScan.example$G;pos<-GenoScan.example$pos
Z<-GenoScan.example$Z

# Preliminary data management
result.prelim<-GenoScan.prelim(Y,X=X,out_type="C",B=5000)

# Scan the region with functional annotations defined in Z
result<-GenoScan.SingleWindow(result.prelim,G,Z=Z)



