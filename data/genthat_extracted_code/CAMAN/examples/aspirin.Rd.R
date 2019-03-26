library(CAMAN)


### Name: aspirin
### Title: Aspirin use and breast cancer risk
### Aliases: aspirin
### Keywords: datasets

### ** Examples

#Example
#Homogeneous Metaregression adjusting for study type and year of publication

data(aspirin)
wgt <- 1/aspirin$var# calculate weights
m0 <- mixcov(dep="logrr", fixed=c("type","yearc"), random="", weight=wgt,
             k=1,family="gaussian",data=aspirin)




