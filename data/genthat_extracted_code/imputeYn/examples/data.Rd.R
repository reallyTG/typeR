library(imputeYn)


### Name: data
### Title: Generating Survival Data from Log-normal AFT Model
### Aliases: data
### Keywords: survival data

### ** Examples

#Dataset with zero correlation between the covariates and the medium censoring level 
#(50 percent) 
data1<-data(n=100, p=2, r=0, b1=c(2,4), sig=1, Cper=0)
data1

#Dataset with moderate correlation between the covariates and the higher censoring level 
#(70 percent) 
data.r<-data(n=100, p=2, r=0.5, b1=c(2,4), sig=1, Cper=0.2)
data.r



