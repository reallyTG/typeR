library(FPCA3D)


### Name: FPCA3D-package
### Title: Three Dimensional Functional Component Analysis
### Aliases: FPCA3D-package FPCA3D
### Keywords: package

### ** Examples

data_in = array(runif(4000,0,1),dim=c(10,10,10,4))
test = FPCA_3D_score(data_in,0.8)



