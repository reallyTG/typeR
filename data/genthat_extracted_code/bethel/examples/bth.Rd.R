library(bethel)


### Name: bth
### Title: The Bethel algorithm
### Aliases: bth
### Keywords: survey

### ** Examples

#Given a population of 1000 individuals (dataframe pop) 
#classified according to sex and geographic area, we have collected 
#yarly data on the following variables: income, number of books read, 
#total days of sporting activities. To run a survey and to obtain 
#the total estimates of these 3 variables (total income,total number 
#of book, total number of days) we calculate the sample size to obtain,
#for example, a precision level (coefficient of variation) of 0.05.

library(bethel)
data(pop)
attach(pop)
str(pop)

#Calculate the dataframe with: 
##- strata labels 
##- estimated variances
##- number of population units

b1<-as.data.frame(cbind(var_Income=tapply(income,strata,var),
var_books=tapply(books,strata,var),
var_days=tapply(sportDays,strata,var),
num_units=tapply(sportDays,strata,length)))
b1<-cbind(strata=row.names(b1),b1)
row.names(b1)<-NULL

#Add 3 columns: 
##- unit cost per interview 
##- minimum sample size n/N (where N is the population size)
##- minimum sample size n

b1<-cbind(b1, c=rep(1,8), n=rep(3,8), n_2=rep(0.04,8))

#Calculate dataframe with:
##- precision levels (coefficients of variation) 
##- total estimates 

b2<-as.data.frame(cbind(CV=rep(0.05,3), tot=colSums(pop[,2:4])))

#Bethel sample according to a precision level (CV) of 0.05

bth(b1,b2)

#Bethel sample according to different precision level (CV)

b2<-as.data.frame(cbind(CV=c(0.05,0.01,0.2), tot=colSums(pop[,2:4])))
bth(b1,b2)





