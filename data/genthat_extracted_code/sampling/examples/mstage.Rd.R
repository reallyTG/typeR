library(sampling)


### Name: mstage
### Title: Multistage sampling
### Aliases: mstage
### Keywords: survey

### ** Examples

############
## Example 1
############
# Two-stage cluster sampling
# Uses the 'swissmunicipalities' data 
data(swissmunicipalities)
b=swissmunicipalities
b=b[order(b$REG,b$CT),]
attach(b)
# the variable 'REG' (region) has 7 categories;
# it is used as clustering variable in the first-stage sample
# the variable 'CT' (canton) has 26 categories; 
# it is used as clustering variable in the second-stage sample
# 4 clusters (regions) are selected in the first-stage 
# 1 canton is selected in the second-stage from each sampled region 
# the method is simple random sampling without replacement in each stage
# (equal probability, without replacement)
m=mstage(b,stage=list("cluster","cluster"), varnames=list("REG","CT"),
size=list(4,c(1,1,1,1)), method=list("srswor","srswor"))
# the first stage is m[[1]], the second stage is m[[2]]
#the selected regions
unique(m[[1]]$REG)
#the selected cantons
unique(m[[2]]$CT)
# extracts the observed data
x=getdata(b,m)[[2]]
# check the output
table(x$REG,x$CT)
############
## Example 2
############
# Two-stage element sampling
# Generates artificial data (a 235X3 matrix with 3 columns: state, region, income).
# The variable "state" has 2 categories ('n','s'). 
# The variable "region" has 5 categories ('A', 'B', 'C', 'D', 'E').
# The variable "income" is generated using the U(0,1) distribution. 
data=rbind(matrix(rep('n',165),165,1,byrow=TRUE),matrix(rep('s',70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep('A',115),rep('D',10),rep('E',40),rep('B',30),rep('C',40)),
100*runif(235))
names(data)=c("state","region","income")
data=data[order(data$state,data$region),]
table(data$state,data$region)
# the method is simple random sampling without replacement
# 25 units are drawn in the first-stage
# in the second-stage, 10 units are drawn from the already 25 selected units
m=mstage(data,size=list(25,10),method=list("srswor","srswor")) 
# the first stage is m[[1]], the second stage is m[[2]]
# extracts the observed data
xx=getdata(data,m)[[2]]
xx
# check the result 
table(xx$state,xx$region)
############
## Example 3
############
# Stratified one-stage cluster sampling
# The same data as in Example 2
# the variable 'state' is used as stratification variable 
# 165 units are in the first stratum and 70 in the second one
# the variable 'region' is used as clustering variable
# 1 cluster (region) is drawn in each state using "srswor" 
m=mstage(data, stage=list("stratified","cluster"), varnames=list("state","region"), 
size=list(c(165,70),c(1,1)),method=list("","srswor")) 
# check the first stage
table(m[[1]]$state)
# check the second stage
table(m[[2]]$region)
# extracts the observed data
xx=getdata(data,m)[[2]]
# check the result
table(xx$state,xx$region)
############
## Example 4
############
# Two-stage cluster sampling
# The same data as in Example 1
# in the first-stage, the clustering variable is 'REG' (region) with 7 categories
# 4 clusters (regions) are drawn in the first-stage 
# each region is selected with the probability 4/7
# in the second-stage, the clustering variable is 'CT'(canton) with 26 categories
# 1 cluster (canton) is drawn in the second-stage from each selected region 
# in region 1, there are 3 cantons; one canton is selected with prob. 0.2, 0.4, 0.4, resp. 
# in region 2, there are 5 cantons; each canton is selected with the prob. 1/5
# in region 3, there are 3 cantons; each canton is selected with the prob. 1/3
# in region 4, there is 1 canton, which it is selected with the prob. 1
# in region 5, there are 7 cantons; each canton is selected with the prob. 1/7
# in region 6, there are 6 cantons; each canton is selected with the prob. 1/6
# in region 7, there is 1 canton, which it is selected with the prob. 1
# it is necessary to use a list of selection probabilities at each stage
# prob is the list of the selection probabilities
# the method is systematic sampling (unequal probabilities, without replacement)
# ls is the list of sizes
ls=list(4,c(1,1,1,1))
prob=list(rep(4/7,7),list(c(0.2,0.4,0.4),rep(1/5,5),rep(1/3,3),rep(1,1),rep(1/7,7),
rep(1/6,6),rep(1,1)))
m=mstage(b,stage=list("cluster","cluster"),varnames=list("REG","CT"),
size=ls, method=c("systematic","systematic"),pik=prob)
#the selected regions
unique(m[[1]]$REG)
#the selected cantons
unique(m[[2]]$CT)
# extracts the observed data
xx=getdata(b,m)[[2]]
# check the result
table(xx$REG,xx$CT)
############
## Example 5
############
# Stratified two-stage cluster sampling
# The same data as in Example 1
# the variable 'REG' is used as stratification variable
# there are 7 strata  
# the variable 'CT' is used as first clustering variable
# first stage, clusters (cantons) are drawn from each region using "srswor" 
# 3 clusters are drawn from the regions 1,2,3,5, and 6, respectively
# 1 cluster is drawn from the regions 4 and 7, respectively
# the variable 'COM' is used as second clustering variable
# second stage, 2 clusters (municipalities) are drawn from each selected canton using "srswor" 
m=mstage(b,stage=list("stratified","cluster","cluster"), varnames=list("REG","CT","COM"),
size=list(size1=table(b$REG),size2=c(rep(3,3),1,3,3,1), size3=rep(2,17)), 
method=list("","srswor","srswor"))
# extracts the observed data
getdata(b,m)[[3]]



