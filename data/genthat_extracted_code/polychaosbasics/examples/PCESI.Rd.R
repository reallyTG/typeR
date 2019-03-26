library(polychaosbasics)


### Name: PCESI
### Title: Compute Sensitivity Indexes from a PCE Design
### Aliases: PCESI
### Keywords: regression

### ** Examples

# Dataset simulated by  using the Ishigami function 
nlhs <- 200 # number of rows 
degree <- 6 # polynomial degree
set.seed(42)# fix the seed for reproductible results
pce <- analyticsPolyLeg(nlhs, degree, 'ishigami')# build the PCE design
ret <- PCESI(pce) # compute the PCE sensivity indexes
print(ret, all=TRUE)



