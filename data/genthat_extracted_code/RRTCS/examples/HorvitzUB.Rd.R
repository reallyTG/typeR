library(RRTCS)


### Name: HorvitzUB
### Title: Horvitz-UB model
### Aliases: HorvitzUB
### Keywords: Confidence_interval Estimation Greenberg Horvitz Qualitative
###   Randomized_response Transformed_variable Variance

### ** Examples

N=802
data(HorvitzUBData)
dat=with(HorvitzUBData,data.frame(I,J,Pi))
p1=0.6
p2=0.7
cl=0.95
HorvitzUB(dat$I,dat$J,p1,p2,dat$Pi,"mean",cl,N)



