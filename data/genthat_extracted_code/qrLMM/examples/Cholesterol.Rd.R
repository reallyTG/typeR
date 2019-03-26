library(qrLMM)


### Name: Cholesterol
### Title: Framingham cholesterol study
### Aliases: Cholesterol
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Cholesterol)
##D attach(Cholesterol)
##D 
##D y  = cholst            #response
##D x  = cbind(1,sex,age)  #design matrix for fixed effects
##D z  = cbind(1,year)     #design matrix for random effects
##D 
##D #A median regression
##D median_reg = QRLMM(y,x,newid,nj,MaxIter = 500)
## End(Not run)



