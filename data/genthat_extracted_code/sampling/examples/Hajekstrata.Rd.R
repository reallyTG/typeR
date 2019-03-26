library(sampling)


### Name: Hajekstrata
### Title: The Hajek estimator for a stratified design
### Aliases: Hajekstrata
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
# the order of the columns is different from the order in the swsissmunicipalities database
x=getdata(swissmunicipalities, st)
# computes the population sizes of strata
N=table(swissmunicipalities$REG)
N=N[unique(x$REG)]
#the strata 1   2   3   4   5   6   7
#corresponds to REG  4   1   3   2   5   6   7 
# computes the Hajek estimator of the variable Pop020 
Hajekstrata(x$Pop020,x$Prob,x$Stratum,N,type="total",description=TRUE)


