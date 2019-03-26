library(MAclinical)


### Name: testclass_simul
### Title: Evaluating a classification method based on simulated data
### Aliases: testclass_simul
### Keywords: htest

### ** Examples

# load MAclinical library
# library(MAclinical)

# Generating 3 simulated data sets
my.data<-simuldata_list(niter=3,n=100,p=150,psig=10,q=5,muX=2,muZ=1)

# Perform prediction of the 60 last observations using the first 40 observations, 
# based on PLS (without pre-validation) and random forests

testclass_simul(my.data,nlearn=40,classifier=plsrf_xz)




