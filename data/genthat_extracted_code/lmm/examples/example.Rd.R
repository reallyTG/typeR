library(lmm)


### Name: example
### Title: lmm package example command file
### Aliases: example
### Keywords: models

### ** Examples

### Model specification ###
data(marijuana)
# To work only on those with complete data
marijuana <- subset(marijuana,!is.na(y))
attach(marijuana)
pred <- cbind(int,dummy1,dummy2,dummy3,dummy4,dummy5)
xcol <- 1:6
zcol <- 1

### ML Estimation ###
ecmeml.result <- ecmeml(y,subj,pred,xcol,zcol)
fastml.result <- fastml(y,subj,pred,xcol,zcol)
#
# which converged in 212 and 8 cycles, respectively. For example, the
# first elemenent of the ML estimate of the fixed effects (the intercept)
# estimates the mean for the last occasion and the other elements of beta
# estimate the differences in means between the first five occasions and
# the last one. So we can find the estimated means for the six occasions.
#
beta.hat <- fastml.result$beta
muhat <- c(beta.hat[2]+beta.hat[1], beta.hat[3]+beta.hat[1],
   beta.hat[4]+beta.hat[1], beta.hat[5]+beta.hat[1],
   beta.hat[6]+beta.hat[1], beta.hat[1]) 

### RML estimation ###
ecmerml.result <- ecmerml(y,subj,pred,xcol,zcol)
fastrml.result <- fastrml(y,subj,pred,xcol,zcol)

### Improved variance estimation in Section 4 ### 
b.hat <- as.vector(fastrml.result$b.hat)
se.new <- sqrt(as.vector(fastrml.result$cov.b.new))
se.old <- sqrt(as.vector(fastrml.result$cov.b))
table2 <- cbind(round(b.hat,3),round(cbind(b.hat-2*se.old,b.hat+2*se.old,
      b.hat-2*se.new,b.hat+2*se.new),2),round(100*(se.new-se.old)/se.old))
dimnames(table2) <- list(paste("Subject",format(1:9)),
   c("Est.","Lower.old","Upper.old","Lower.new","Upper.new","Increase (%)"))
print(table2)
#
# which reproduces Table 2 and compares 95% interval estimates
# under the new method to conventional empirical Bayes intervals.

### MCMC in Section 5 ###
prior <- list(a=3*100,b=3,c=3,Dinv=3*5)
gibbs.result <- mgibbs(y,subj,pred,xcol,zcol,prior=prior,seed=1234,iter=5000)
fmcmc.result <- fastmcmc(y,subj,pred,xcol,zcol,prior=prior,seed=2345,iter=5000)
#
# which run 5,000 cycles for each algorithm and generates Figure 1.
#
# library(ts)
par(mfrow=c(2,1))
acf(log(gibbs.result$psi.series[1,1,]),lag.max=10, ylim=0:1)
acf(log(fmcmc.result$psi.series[1,1,]),lag.max=10, ylim=0:1)
detach(marijuana)



