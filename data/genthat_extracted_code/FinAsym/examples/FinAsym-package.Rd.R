library(FinAsym)


### Name: FinAsym-package
### Title: Classifies implicit trading activity from market quotes and
###   computes the probability of informed trading
### Aliases: FinAsym-package FinAsym
### Keywords: package

### ** Examples

#Sample data
mydata<-matrix(c(4.56, 4.7, 4.57, 4.64, 4.53, 
4.65, 4.59, 4.66, 4.55, 4.65, 4.59, 4.66, 4.59, 
4.66, 4.55, 4.65, 4.55, 4.65, 4.55, 4.65, 4.59, 
4.66, 4.55, 4.65, 4.59, 4.66, 4.59, 4.66), 
nrow=14, byrow=TRUE)

#Trading day
gname <- 'June 29 2006'
	
ind_bid <- c(1)
ind_ask <- c(2)
	
quotes_types <- classify_quotes(mydata, ind_bid, 
ind_ask, gname)

#Again, sample data for 15 trading sessions
qdata      <- matrix(0, 3 ,1)
qdata[1]   <- 9
qdata[2]   <- 6
qdata[3]   <- 13
classified <- matrix(qdata,3,15)

#Make a starting guess at the solution
par0 <- c(0.5, 0.5, 0.5, 0.5)  

param_optim <- optim(par0, pin_likelihood, 
gr=NULL, classified)

alph <- c( param_optim$par[3] )
miu  <- c( param_optim$par[2] )
delt <- c( param_optim$par[4] )
epsi <- c( param_optim$par[1] )

PSI <- c( ( 1-miu )*epsi + miu )
pin <- c( miu/PSI )

msg_pin <- paste("The average PIN over the 
trading period is:", pin, sep=" ")

print( msg_pin )



