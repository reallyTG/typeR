library(EstCRM)


### Name: simCRM
### Title: Generating Data under the Continuous Response Model
### Aliases: simCRM

### ** Examples


#####################################################
#                      Example 1:                   #
#   Basic data generation and parameter recovery    #
#####################################################

#Generate true person ability parameters for 1000 examinees from 
#a standard normal distribution

true.thetas <- rnorm(1000,0,1)

#Generate the true item parameter matrix for the hypothetical items

true.par <- matrix(c(.5,1,1.5,2,2.5,
-1,-.5,0,.5,1,1,.8,1.5,.9,1.2),
nrow=5,ncol=3)
true.par

#Generate the vector maximum possible scores that students can 
#get for the items

max.item <- c(30,30,30,30,30)

#Generate the response matrix

simulated.data <- simCRM(true.thetas,true.par,max.item)

#Let's examine the simulated data

head(simulated.data)
summary(simulated.data)

#Let's try to recover the item parameters

min.item <- c(0,0,0,0,0)

CRM <- EstCRMitem(simulated.data,max.item, min.item,
max.EMCycle=500,converge=0.01)

#Compare the true item parameters with the estimated item parameters. 
#The first three column is the true item parameters, and the second
#three column is the estimated item parameters

cbind(true.par,CRM$param)

#Let's recover the person parameters

par <- CRM$param
CRMthetas <- EstCRMperson(simulated.data,par,min.item,max.item)
theta.par <- CRMthetas$thetas

#Compare the true person ability parameters to the estimated person
##ability parameters.The first column is the true parameters and the
##second column is the estimated parameters

thetas <- cbind(true.thetas,theta.par[,2])
head(thetas)
cor(thetas)
plot(thetas[,1],thetas[,2])

#RMSE for the estimated person parameters

sqrt(sum((thetas[,1]-thetas[,2])^2)/nrow(thetas))

#RMSE is comparable and similar to the standard error of the 
#theta estimates. Standard error of the theta estimate is the square
#root of the reciprocal of the total test information which is the sum
#of square of the "a" parameters

sqrt(1/sum(CRM$param[,1]^2))

#####################################################
#                      Example 2:                   #
#   Item fit Residuals, Empirical and Theoretical   #
#  Item Category Response Curves for the Simulated  #
#                    Data Above                     #
#####################################################

#Because of the run time issues during the package development,
#I run the fit analysis for a subset of simulated data above.
#The simulated data has 1000 examinees, but I run the fit analysis
#for the first 100 subjects of the simulated data. Please ignore the 
#following line and run the analysis for whole data

simulated.data <- simulated.data[1:100,] #Ignore this line 

par <- CRM$param
max.item <- c(30,30,30,30,30)
min.item <- c(0,0,0,0,0)
CRMthetas <- EstCRMperson(simulated.data,par,min.item,max.item)
theta.par <- CRMthetas$thetas
mean(theta.par[,2])
sd(theta.par[,2])
hist(theta.par[,2])

fit <- fitCRM(simulated.data,par, CRMthetas, max.item, group=10)

#Item-Fit Residuals

fit$fit.stat

#Empirical Item Category Response Curves
fit$emp.irf[[1]]   #Item 1
fit$emp.irf[[5]]   #Item 5

#Theoretical Item Category Response Curves
plotCRM(par,1,min.item, max.item)   #Item 1



#####################################################
#                      Example 3:                   #
#   The replication of Shojima's simulation study   #
#                         2005                      #
#####################################################

#In Shojima's simulation study published in 2005

 #true person parameters were generated from a standard normal distribution.
 #The natural logarithm of the true "a" parameters were generated from a N(0,0.09)
 #The true "b" parameters were generated from a N(0,1)
 #The natural logarithm of the true "alpha" parameters were generated from a N(0,0.09)

#The independent variables were the number of items and sample size 
#in the simulation study

#There were 9 different conditions and 100 replications for each condition.

#In Table 1 (Shojima,2005), the RMSD statistics were reported for each condition.

#The code below replicates the same study. The results are comparable to the Table 1. 
#The user 
#should only specify the sample size and the number of items. Then, the user should 
#run the rest of the code. 
#At the end, RMSEa, RMSEb, RMSEalp are the item parameter recovery statistics which is 
#comparable to Table 1


#Set the conditions for the simulation study. 
#It takes longer to run for big number of replications

N=500              #sample size
n=10               #number of items
replication=1      #number if replications for each condition  

############################################################
#       Run the rest of the code from START to END         #
############################################################

#START

true.person <- vector("list",replication)
true.item <- vector("list",replication)
est.person <- vector("list",replication)
est.item <- vector("list",replication)
simulated.datas <- vector("list",replication)

for(i in 1:replication) {
true.person[[i]] <- rnorm(N,0,1)
true.item[[i]] <- cbind(exp(rnorm(n,0,.09)),rnorm(n,0,1),1/exp(rnorm(n,0,.09)))
}

max.item <- rep(50,n)
min.item <- rep(0,n)

for(i in 1:replication) {
simulated.datas[[i]] <- simCRM(true.person[[i]],true.item[[i]],max.item)
}

for(i in 1:replication) {
CRM<-EstCRMitem(simulated.datas[[i]],max.item,min.item,max.EMCycle= 500,converge=0.01)
est.item[[i]]=CRM$par
}
for(i in 1:replication) {
persontheta <- EstCRMperson(simulated.datas[[i]],est.item[[i]],min.item,max.item)
est.person[[i]]<- persontheta$thetas[,2]
}

#END
############################################################

#RMSE for parameter "a"

RMSEa <- c()
for(i in 1:replication) {
RMSEa[i]=sqrt(sum((true.item[[i]][,1]-est.item[[i]][,1])^2)/n)
}

mean(RMSEa)


#RMSE for parameter "b"

RMSEb <- c()
for(i in 1:replication) {
RMSEb[i]=sqrt(sum((true.item[[i]][,2]-est.item[[i]][,2])^2)/n)
}

mean(RMSEb)

#RMSE for parameter "alpha" 
RMSEalp <- c()
for(i in 1:replication) {
RMSEalp[i]=sqrt(sum((true.item[[i]][,3]-est.item[[i]][,3])^2)/n)
}

mean(RMSEalp)

#RMSE for person parameter

RMSEtheta <- c()
for(i in 1:replication) {
RMSEtheta[i]=sqrt(sum((true.person[[i]]-est.person[[i]])^2)/N)
}

mean(RMSEtheta)




