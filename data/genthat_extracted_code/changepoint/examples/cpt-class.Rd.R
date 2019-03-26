library(changepoint)


### Name: cpt-class
### Title: Class "cpt"
### Aliases: cpt-class cpt-method,cpts cpt-method,cpttype
###   cpt-method,data.set cpt-method,data.set.ts cpt-method,test.stat
###   cpt-method,ncpts.max cpt-method,method cpt-method,minseglen
###   cpt-method,param.est cpt-method,pen.type cpt-method,pen.value
###   cpt-method,cpts<- cpt-method,cpttype<- cpt-method,data.set<-
###   cpt-method,test.stat<- cpt-method,ncpts.max<- cpt-method,method<-
###   cpt-method,minseglen<- cpt-method,param.est<- cpt-method,pen.type<-
###   cpt-method,pen.value<- cpt-method,print cpt-method,summary
###   cpt-method,plot cpt-method,param cpt-method,logLik
### Keywords: classes cpt internal

### ** Examples

showClass("cpt") # shows the structure of the cpt class

x=new("cpt") # creates a new object with the cpt class defaults
cpts(x) # retrieves the cpts slot from x
cpts(x)<-c(10,50,100) # replaces the cpts slot from x with c(10,50,100)

# Example of a change in variance at 100 in simulated normal data
set.seed(1)
x=c(rnorm(100,0,1),rnorm(100,0,10))
ans=cpt.var(x) 
print(ans) # prints details of the analysis including a summary
summary(ans)
plot(ans) # plots the data with change (vertical line) at 100
logLik(ans) # raw likelihood of the data with changepoints, second value is likelihood + penalty



