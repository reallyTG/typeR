library(sampling)


### Name: HTstrata
### Title: The Horvitz-Thompson estimator for a stratified design
### Aliases: HTstrata
### Keywords: survey

### ** Examples

# Swiss municipalities data base
data(swissmunicipalities)
# the variable 'REG' has 7 categories in the population 
# it is used as stratification variable
# computes the population stratum sizes
table(swissmunicipalities$REG)
# do not run
#  1   2   3   4   5   6   7
# 589 913 321 171 471 186 245
# the sample stratum sizes are given by size=c(30,20,45,15,20,11,44)
# the method is simple random sampling without replacement 
# (equal probability, without replacement)
st=strata(swissmunicipalities,stratanames=c("REG"),size=c(30,20,45,15,20,11,44), 
method="srswor")
# extracts the observed data
# the order of the columns is different from the order in the initial database
x=getdata(swissmunicipalities, st)
# computes the HT estimator of the variable Pop020 
HTstrata(x$Pop020,x$Prob,x$Stratum,description=TRUE)



