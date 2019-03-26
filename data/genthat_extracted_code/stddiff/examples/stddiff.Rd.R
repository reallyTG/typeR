library(stddiff)


### Name: stddiff
### Title: Calculate the Standardized Difference for Numeric, Binary and
###   Category Variables
### Aliases: stddiff stddiff.numeric stddiff.binary stddiff.category
### Keywords: standardized difference, propensity score matching

### ** Examples

#set.seed(2016)
#treat<-round(abs(rnorm(100)+1)*10,0) %% 2
#numeric<-round(abs(rnorm(100)+1)*10,0)
#binary<-round(abs(rnorm(100)+1)*10,0) %% 2
#category<-round(abs(rnorm(100)+1)*10,0) %% 3
#data<-data.frame(treat,numeric,binary,category)
#stddiff.numeric(data=data,gcol=1,vcol=c(2,2))
#stddiff.binary(data=data,gcol=1,vcol=c(3,3))
#stddiff.category(data=data,gcol=1,vcol=c(4,4))



