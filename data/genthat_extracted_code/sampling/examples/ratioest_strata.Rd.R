library(sampling)


### Name: ratioest_strata
### Title: The ratio estimator for a stratified design
### Aliases: ratioest_strata
### Keywords: survey

### ** Examples

###########
# Example 1
###########
# this example uses MU284 data with the 'REG' variable for stratification
data(MU284)
attach(MU284)
# there are 3 outliers which are deleted from the population
MU281=MU284[RMT85<=3000,]
detach(MU284)
attach(MU281)
# computes the inclusion probabilities using the variable P85
pik=inclusionprobabilities(P85,120)
# defines the variable of interest
y=RMT85
# defines the auxiliary information
x=CS82
# computes the population stratum sizes
table(MU281$REG)
# not run
# 1  2  3  4  5  6  7  8 
# 24 48 32 37 55 41 15 29 
# a sample is drawn in each region
# the sample stratum sizes are given by size=c(4,10,8,4,6,4,6,7)
s=strata(MU281,c("REG"),size=c(4,10,8,4,6,4,6,7), method="systematic",pik=P85)
# extracts the observed data
MU281sample=getdata(MU281,s)
# computes the population x-totals in each stratum
TX_strata=as.vector(tapply(CS82,list(REG),FUN=sum))
# computes the ratio estimator
ratioest_strata(MU281sample$RMT85,MU281sample$CS82,TX_strata,
MU281sample$Prob,MU281sample$Stratum)
###########
# Example 2
###########
# this is an artificial example (see Example 1 in the 'strata' function)
# there are 4 columns: state, region, income and aux
# 'income' is the variable of interest, and 'aux' is the auxiliary information 
# which is correlated to the income
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
attach(data)
aux=income+rnorm(length(income),0,1)
data=cbind.data.frame(data,aux)
# computes the population stratum sizes
table(data$region,data$state)
# not run
#     nc  sc
#  1 100  30
#  2  50  40
#  3  15   0
# there are 5 cells with non-zero values; one draws 5 samples (1 sample in each stratum)
# the sample stratum sizes are 10,5,10,4,6, respectively
# the method is 'srswor' (equal probability, without replacement)
s=strata(data,c("region","state"),size=c(10,5,10,4,6), method="srswor")
# extracts the observed data
xx=getdata(data,s)
# computes the population x-total for each stratum
TX_strata=na.omit(as.vector(tapply(aux,list(region,state),FUN=sum)))
# computes the ratio estimator 
ratioest_strata(xx$income,xx$aux,TX_strata,xx$Prob,xx$Stratum,description=TRUE)



