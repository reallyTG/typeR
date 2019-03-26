## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
##Poisson with Exp trawl
set.seed(1)
t<-1000
Delta<-1
v<-250
lambda <-0.25

#Simulate a univariate trawl process with exponential trawl function and Poisson marginal law
trawl <-trawl::sim_UnivariateTrawl(t,Delta,burnin=50,marginal =c("Poi"),trawl ="Exp",v=v, lambda1=lambda)

#Plot the sample path of the simulated process
plot(trawl,type="l")

#Fit the exponential trawl function to the simulated data
fittrawlfct <- trawl::fit_Exptrawl(trawl,Delta, plotacf=TRUE,lags=500)

#Fit the marginal Poisson law
fitmarginallaw <-trawl::fit_marginalPoisson(trawl, fittrawlfct$LM, plotdiag=TRUE)

###Print the results
print(paste("lambda: estimated:", fittrawlfct$lambda, ", theoretical:", lambda))
print(paste("v: estimated:", fitmarginallaw$v, ", theoretical:", v))



## ------------------------------------------------------------------------
##Poisson with supIG trawl
set.seed(1)
t<-1000
Delta<-1
v<-250
delta <-0.2
gamma <-0.5

#Simulate a univariate trawl process with supIG trawl function and Poisson marginal law
trawl <-trawl::sim_UnivariateTrawl(t,Delta,burnin=100,marginal =c("Poi"),trawl ="supIG",v=v, delta=delta, gamma=gamma)

#Plot the sample path of the simulated process
plot(trawl,type="l")

#Fit the supIG trawl function to the simulated data
fittrawlfct <- trawl::fit_supIGtrawl(trawl,Delta, plotacf=TRUE,lags=500)

#Fit the marginal Poisson law
fitmarginallaw <-trawl::fit_marginalPoisson(trawl, fittrawlfct$LM, plotdiag=TRUE)

###Print the results
print(paste("delta: estimated:", fittrawlfct$delta, ", theoretical:", delta))
print(paste("gamma: estimated:", fittrawlfct$gamma, ", theoretical:", gamma))
print(paste("v: estimated:", fitmarginallaw$v, ", theoretical:", v))


## ------------------------------------------------------------------------
##Negative binomial with Exp trawl
set.seed(1)
t<-1000
Delta<-1
m<-200
theta<-0.5
lambda <-0.25

m*abs(log(1-theta)) #=v

#Simulate a univariate trawl process with exponential trawl function and negative binomial marginal law
trawl <-trawl::sim_UnivariateTrawl(t,Delta,burnin=50,marginal =c("NegBin"),trawl ="Exp",m=m, theta=theta, lambda1=lambda)

#Plot the sample path of the simulated process
plot(trawl,type="l")

#Fit the exponential trawl function to the simulated data
fittrawlfct <- trawl::fit_Exptrawl(trawl,Delta, plotacf=TRUE,lags=500)

#Fit the marginal negative binomial law
fitmarginallaw <-trawl::fit_marginalNB(trawl, fittrawlfct$LM, plotdiag=TRUE)

###Print the results
print(paste("lambda: estimated:", fittrawlfct$lambda, ", theoretical:", lambda))
print(paste("m: estimated:", fitmarginallaw$m, ", theoretical:", m))
print(paste("theta: estimated:", fitmarginallaw$theta, ", theoretical:", theta))



## ------------------------------------------------------------------------
##Negative binomial with LM trawl
set.seed(1)
t<-1000
Delta<-1
m<-200
theta<-0.5
m*abs(log(1-theta)) #=v
alpha <-2
H <-3

#Simulate a univariate trawl process with long memory trawl function and negative binomial marginal law
trawl <-trawl::sim_UnivariateTrawl(t,Delta,burnin=100,marginal =c("NegBin"),trawl ="LM",m=m,theta=theta, alpha=alpha, H=H)

#Plot the sample path of the simulated process
plot(trawl,type="l")

#Fit the long memory trawl function to the simulated data
fittrawlfct <- trawl::fit_LMtrawl(trawl,Delta, plotacf=TRUE,lags=500)

#Fit the marginal negative binomial law
fitmarginallaw <-trawl::fit_marginalNB(trawl, fittrawlfct$LM, plotdiag=TRUE)

###Print the results
print(paste("alpha: estimated:", fittrawlfct$alpha, ", theoretical:", alpha))
print(paste("H: estimated:", fittrawlfct$H, ", theoretical:", H))
print(paste("m: estimated:", fitmarginallaw$m, ", theoretical:", m))
print(paste("theta: estimated:", fitmarginallaw$theta, ", theoretical:", theta))


## ------------------------------------------------------------------------
#Exponential trawls
lambda1 <- 1.2
lambda2 <- 1.5

#Parameters of the negative binomial marginal law
m1<- 2.1
theta1 <- 0.9
a1 <-27.3

m2 <- 2.3
theta2 <-0.9
a2 <- 35.3


kappa12 <-m1
kappa1 <- 0
kappa2 <- m2-kappa12

#Specify the time period and grid
t <-720
Delta <- 1


##Fix the seed
set.seed(1)

#Simulate the bivariate trawl process with common factor and independent components ("dep") and
#negative binomial marginal law. Both trawl functions are chosen as exponentials.
simdata<-trawl::sim_BivariateTrawl(t, Delta, burnin=10,marginal ="NegBin", dependencetype="dep",
                              trawl1 ="Exp", trawl2 ="Exp",
                              kappa1=kappa1,kappa2=kappa2,kappa12=kappa12,a1=a1,a2=a2,
                              lambda11=lambda1, lambda21 =lambda2)
  
trawl1 <- simdata[,1]
trawl2 <- simdata[,2]

#####Produce a bivariate histogram of the simulated data
trawl::plot_2and1hist(trawl1,trawl2)


###Fit the parameters of the exponential trawl functions
fit1 <- trawl::fit_Exptrawl(trawl1)
fit2 <- trawl::fit_Exptrawl(trawl2)

###Fit negative binomial model
fitNB1 <- trawl::fit_marginalNB(trawl1,fit1$LM,TRUE)
fitNB2 <- trawl::fit_marginalNB(trawl2,fit2$LM,TRUE)

###Compute the intersection between the two trawls
R12 <- trawl::fit_trawl_intersection("Exp","Exp",lambda11=fit1$memory,lambda21=fit2$memory, LM1=fit1$LM, LM2=fit2$LM,TRUE)

###Fit the remaining parameters from the bivariate negative binomial law
kappa12_est <- min(stats::cov(trawl1,trawl2)/(R12*fitNB1$a*fitNB2$a),fitNB1$m,fitNB2$m)
kappa1_est <-max(fitNB1$m -kappa12,0)
kappa2_est <-max(fitNB2$m -kappa12,0)

###Print the results
print("Estimated parameters of the exponential trawl functions:")
print(paste("lambda1: estimated:", fit1$lambda, ", theoretical:", lambda1))
print(paste("lambda2: estimated:", fit2$lambda, ", theoretical:", lambda2))

print("Estimated parameters of the bivariate negative binomial law:")
print(paste("m1: estimated:", fitNB1$m, ", theoretical:", m1))
print(paste("theta1: estimated:", fitNB1$theta, ", theoretical:", theta1))
print(paste("alpha1: estimated:", fitNB1$a, ", theoretical:", a1))


print(paste("m2: estimated:", fitNB2$m, ", theoretical:", m2))
print(paste("theta2: estimated:", fitNB2$theta, ", theoretical:", theta2))
print(paste("alpha2: estimated:", fitNB2$a, ", theoretical:", a2))

print(paste("kappa12: estimated:", kappa12_est, ", theoretical:", kappa12))
print(paste("kappa1: estimated:", kappa1_est, ", theoretical:", kappa1))
print(paste("kappa2: estimated:", kappa2_est, ", theoretical:", kappa2))


