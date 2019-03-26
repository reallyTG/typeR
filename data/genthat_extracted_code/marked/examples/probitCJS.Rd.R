library(marked)


### Name: probitCJS
### Title: Perform MCMC analysis of a CJS model
### Aliases: probitCJS

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
# Analysis of the female dipper data
data(dipper)
dipper=dipper[dipper$sex=="Female",]
# following example uses unrealistically low values for burnin and 
# iteration to reduce package testing time
fit1 = crm(dipper,model="probitCJS",model.parameters=list(Phi=list(formula=~time),
 p=list(formula=~time)), burnin=100, iter=1000)
fit1
# Real parameter summary
fit1$results$reals

# Changing prior distributions:
fit2 = crm(dipper,model="probitCJS",
   model.parameters=list(
     Phi=list(formula=~time, prior=list(mu=rep(0,6), tau=1/2.85^2)),
     p=list(formula=~time, prior=list(mu=rep(0,6), tau=1/2.85^2))
   ), burnin=100, iter=1000)
fit2
# Real parameter summary
fit2$results$reals

# Creating a Q matrix for random walk effect for 6 recapture occasions
A=1.0*(as.matrix(dist(1:6))==1)
Q = diag(apply(A,1,sum))-A

# Fit a RW survival process
fit3 = crm(dipper,model="probitCJS",
   model.parameters=list(
     Phi=list(
       formula=~(1|time), 
       prior=list(mu=0, tau=1/2.85^2, re=list(a=2, b=1.0E-4, Q=list(Q)))
       ),
     p=list(formula=~time, prior=list(mu=rep(0,6), tau=1/2.85^2))
   ), burnin=100, iter=1000)
fit3
# Real parameter summary (Not calculated for random effects yet)
fit3$results$reals

## End(No test)



