library(sampling)


### Name: strata
### Title: Stratified sampling
### Aliases: strata
### Keywords: survey

### ** Examples

############
## Example 1
############
# Example from An and Watts (New SAS procedures for Analysis of Sample Survey Data)
# generates artificial data (a 235X3 matrix with 3 columns: state, region, income).
# the variable "state" has 2 categories ('nc' and 'sc'). 
# the variable "region" has 3 categories (1, 2 and 3).
# the sampling frame is stratified by region within state.
# the income variable is randomly generated
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
# computes the population stratum sizes
table(data$region,data$state)
# not run
#     nc  sc
#  1 100  30
#  2  50  40
#  3  15   0
# there are 5 cells with non-zero values
# one draws 5 samples (1 sample in each stratum)
# the sample stratum sizes are 10,5,10,4,6, respectively
# the method is 'srswor' (equal probability, without replacement)
s=strata(data,c("region","state"),size=c(10,5,10,4,6), method="srswor")
# extracts the observed data
getdata(data,s)
# see the result using a contigency table
table(s$region,s$state)
############
## Example 2
############
# The same data as in Example 1
# the method is 'systematic' (unequal probability, without replacement)
# the selection probabilities are computed using the variable 'income'
s=strata(data,c("region","state"),size=c(10,5,10,4,6), method="systematic",pik=data$income)
# extracts the observed data
getdata(data,s)
# see the result using a contigency table
table(s$region,s$state)
############
## Example 3
############
# Uses the 'swissmunicipalities' data as population for drawing a sample of units
data(swissmunicipalities)
# the variable 'REG' has 7 categories in the population
# it is used as stratification variable
# Computes the population stratum sizes
table(swissmunicipalities$REG)
# do not run
#  1   2   3   4   5   6   7 
# 589 913 321 171 471 186 245 
# sort the data to obtain the same order of the regions in the sample
data=swissmunicipalities
data=data[order(data$REG),]
# the sample stratum sizes are given by size=c(30,20,45,15,20,11,44)
# 30 units are drawn in the first stratum, 20 in the second one, etc.
# the method is simple random sampling without replacement 
# (equal probability, without replacement)
st=strata(data,stratanames=c("REG"),size=c(30,20,45,15,20,11,44), method="srswor")
# extracts the observed data
getdata(data, st)
# see the result using a contingency table
table(st$REG)



