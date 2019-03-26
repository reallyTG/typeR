library(pdR)


### Name: ptm
### Title: Threshold specification of panel data
### Aliases: ptm

### ** Examples

# library(pdR)
#data(invest)
#dat<-invest[1:1500,]    # subsetting the first 1500 obs., #for simplicity
#t <- 15            #Length of time period
#nt <- nrow(dat)
#n <- nt/t           # number of cross-section units

#dep<- as.matrix(dat[,1])       # investment/assets
#th1<- as.matrix(dat[,2])  #Tobin's Q
#th2<- as.matrix(dat[,3])  # cash-flow/assets
#ind1<- cbind(th1,th2)  #regime-dep covariates 
#d <- as.matrix(dat[,4])      # Threshold variable      
#ind2 <- cbind((th1^2),(th1^3),(th1*d)) # regime-indep covariates:
#bootn<-c(100,200,300)  # bootstrapping replications for each  threshold esitmation
#trimn<-c(0.05,0.05,0.05)   #trimmed percentage for each threshold  esitmation

#qn<-400
#conf_lev<-0.95

#Output=ptm(dep,ind1,ind2,d,bootn,trimn,qn,conf_lev,t,n)
#Output[[1]] #Formatted output of 1st threshold, 2 regimes
#Output[[2]] #Formatted output of 2nd threshold, 3 regimes
#Output[[3]] #Formatted output of 3rd threshold, 4 regimes

# In the output, the Regime-dependent Coefficients matrix
# is, from top to bottom, regime-wise.



