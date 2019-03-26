library(qrLMM)


### Name: Orthodont
### Title: Growth curve data on an orthdontic measurement
### Aliases: Orthodont
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Orthodont)
##D attach(Orthodont)
##D 
##D sex = c()
##D sex[Sex=="Male"]=0
##D sex[Sex=="Female"]=1
##D 
##D y  = distance         #response
##D x  = cbind(1,sex,age) #design matrix for fixed effects
##D z  = cbind(1,age)     #design matrix for random effects
##D 
##D 
##D #A median regression
##D median_reg = QRLMM(y,x,z,Subject,MaxIter = 500)
## End(Not run)



