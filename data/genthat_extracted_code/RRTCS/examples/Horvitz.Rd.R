library(RRTCS)


### Name: Horvitz
### Title: Horvitz model
### Aliases: Horvitz
### Keywords: Confidence_interval Estimation Greenberg Horvitz Qualitative
###   Randomized_response Transformed_variable Variance

### ** Examples

N=10777
data(HorvitzData)
dat=with(HorvitzData,data.frame(z,Pi))
p=0.5
alpha=0.6666667
cl=0.95
Horvitz(dat$z,p,alpha,dat$Pi,"mean",cl,N)

#Horvitz real survey
N=10777
n=710
data(HorvitzDataRealSurvey)
p=0.5
alpha=1/12
pi=rep(n/N,n)
cl=0.95
Horvitz(HorvitzDataRealSurvey$sex,p,alpha,pi,"mean",cl,N)



