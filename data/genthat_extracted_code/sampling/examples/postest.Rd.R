library(sampling)


### Name: postest
### Title: The poststratified estimator
### Aliases: postest
### Keywords: survey

### ** Examples

############
## Example 1
############
#stratified sampling and poststratification
# Swiss municipalities data base
data(swissmunicipalities)
attach(swissmunicipalities)
# the variable 'REG' has 7 categories in the population
# it is used as stratification variable
# Computes the population stratum sizes
table(swissmunicipalities$REG)
# do not run
#  1   2   3   4   5   6   7 
# 589 913 321 171 471 186 245 
# the sample stratum sizes are given by size=c(30,20,45,15,20,11,44)
# the method is simple random sampling without replacement 
st=strata(swissmunicipalities,stratanames=c("REG"),
size=c(30,20,45,15,20,11,44), method="srswor")
# extracts the observed data
# the order of the columns is different from the order in the initial database
x=getdata(swissmunicipalities, st)
px=poststrata(x,"REG")
ct=unique(px$data$REG)
yy=numeric(length(ct))
for(i in 1:length(ct))
  {xx=swissmunicipalities[REG==ct[i],]
   yy[i]=nrow(xx)
  }
yy
postest(px$data,y=px$data$Pop020,pik=px$data$Prob,NG=diag(yy),description=TRUE)
HTstrata(x$Pop020,x$Prob,x$Stratum)
#the two estimators are equal
############
## Example 2
############
# systematic sampling and poststratification
# Belgian municipalities data base
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
pik=inclusionprobabilities(Tot,200)
#selects a sample
s=UPsystematic(pik)  
#the sample is
as.vector(name[s==1])
# extracts the observed data
b=getdata(belgianmunicipalities,s)
attach(belgianmunicipalities)
pb=poststrata(b,"Province") 
#computes the population frequency in each group
ct=unique(pb$data$Province)
yy=numeric(length(ct))
for(i in 1:length(ct))
  {xx=belgianmunicipalities[Province==ct[i],]
   yy[i]=nrow(xx)
  }
postest(pb$data,y=pb$data$TaxableIncome,pik=pik[s==1],NG=yy,description=TRUE)
HTestimator(pb$data$TaxableIncome,pik=pik[s==1])
############
## Example 3
############
#cluster sampling and postratification
# Swiss municipalities data base
data(swissmunicipalities)
# the variable 'REG' has 7 categories in the population
# it is used as clustering variable
# the sample size is 3; the method is simple random sampling without replacement
cl=cluster(swissmunicipalities,clustername=c("REG"),size=3,method="srswor")
# extracts the observed data 
# the order of the columns is different from the order in the initial database
c=getdata(swissmunicipalities, cl)
pc=poststrata(c,"CT") 
#computes the population frequency in each group
ct=unique(pc$data$CT)
yy=numeric(length(ct))
for(i in 1:length(ct))
  {xx=swissmunicipalities[CT==ct[i],]
   yy[i]=nrow(xx)
  }
postest(pc$data,y=pc$data$Pop020,pik=pc$data$Prob,NG=yy,description=TRUE)
############
## Example 4
############
#postratification with two criteria
#artificial data frame
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
#selects a sample of size 10
s=srswor(10,nrow(data))  
# postratification using region and state
ps=poststrata(data[s==1,],c("region","state"))
#computes the population frequency in each group
ct=unique(ps$data$poststratum)
yy=numeric(length(ct))
for(i in 1:length(ct))
  {
   xy=ps$data[ps$data$poststratum==ct[i],]
   xstate=unique(xy$state)
   ystate=unique(xy$region)
   xx=data[data$state==xstate & data$region==ystate,]
   yy[i]=nrow(xx)
  }
postest(ps$data,y=ps$data$income,pik=rep(10/nrow(data),10),NG=yy,description=TRUE)



