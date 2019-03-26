library(portes)


### Name: portest
### Title: Portmanteau Test Statistics
### Aliases: portest
### Keywords: Portmanteau Test

### ** Examples

## Not run: 
##D #################################################################################
##D ####                                                                         ####
##D ####                             Portmanteau Tests                           ####  
##D ####                                                                         #### 
##D #################################################################################
##D ## Monte-Carlo (MC) and asymptotic tests for randomness series                 ##
##D #################################################################################
##D data("DEXCAUS")
##D returns <- log(DEXCAUS[-1]/DEXCAUS[-length(DEXCAUS)])
##D portest(returns)            ## MC using one CPU takes about 24.16 seconds
##D portest(returns, ncores=4)    ## MC using 4 CPUs takes about 9.51 seconds
##D portest(returns, MonteCarlo=FALSE)              ## asymptotic MahdiMcLeod
##D portest(returns,test="LjungBox", MonteCarlo=FALSE) ## asymptotic LjungBox 
##D #################################################################################
##D ## Monte-Carlo goodness-of-fit arima test using 4 CPUs                         ##
##D #################################################################################
##D ## arima() function takes about 11.32 seconds
##D ## Example 1
##D ans1 <- arima(WWWusage,order=c(3,1,0))
##D portest(ans1, ncores = 4)
##D #
##D ## arima0() function takes about 11.1 seconds
##D ## Example 2
##D ans2 <- arima0(WWWusage,order=c(3,1,0))
##D portest(ans2, ncores = 4)
##D #
##D ## Arima() or auto.arima() functions from forecast package take about 12.1 seconds
##D ## Example 3
##D ans3 <- Arima(WWWusage,order=c(3,1,0))
##D portest(ans3, ncores = 4)
##D #
##D ## ar() function takes about 7.39 seconds
##D ## Example 4
##D ans4 <- ar(Nile,order.max=2)
##D portest(ans4, ncores = 4)
##D #
##D ## ar() function with your own R code takes about 8.75 seconds
##D ## Example 5
##D fit.model <- function(data){
##D     fit <- ar(data,aic = FALSE, order.max=2)
##D     order <- 2
##D     res <- ts(fit$resid[-(1:order)]) 
##D     phi <- fit$ar
##D     theta <- NULL
##D     sigma <- fit$var.pred
##D     demean <- fit$x.mean
##D  list(res=res,phi=phi,theta=theta,sigma=sigma,demean=demean)
##D }
##D sim.model <- function(parSpec){
##D     res <- parSpec$res
##D     n <- length(res)  
##D     innov <- function(n) ts(stats::rnorm(n, mean = demean, sd = sqrt(sigma))) 
##D     phi <- parSpec$phi
##D     theta <- parSpec$theta
##D     sigma <- parSpec$sigma 
##D     demean <- parSpec$demean 
##D    arima.sim(n = n, list(ar = phi, ma = theta), rand.gen=innov)
##D }
##D ans5 <- fit.model(Nile)
##D portest(ans5,ncores=4,model=list(sim.model=sim.model,fit.model=fit.model),pkg.name="stats")
##D #################################################################################
##D ## Monte-Carlo test for seasonality                                            ##
##D #################################################################################
##D ## Accidental Deaths in the US 1973 - 1978
##D seasonal.arima<-Arima(USAccDeaths,order=c(0,1,1),seasonal=list(order= c(0,1,1)))
##D portest(seasonal.arima,ncores=4,nrep=1000,lags=1:5)
##D ## Quarterly U.K. economic time series from 1957 Q3 to 1967 Q4
##D cd <- EconomicUK[,1]
##D cd.fit <- Arima(cd,order=c(0,1,0),seasonal=list(order=c(0,1,1),period=4))
##D portest(cd.fit, lags = c(5,10),ncores=4)
##D #################################################################################
##D ## Monte-Carlo test for linear models and time series regression               ##
##D #################################################################################
##D ## Linear Model
##D require("car")
##D fit <- lm(fconvict ~ tfr + partic + degrees + mconvict, data=Hartnagel)
##D portest(fit,lags=1:3,ncores=4)          ## MC of MahdiMcLeod test
##D ## MC of generalized Durbin-Watson test needs the argument function fn() as follows
##D fn <- function(obj,lags){
##D      test.stat <- numeric(length(lags))
##D        for (i in 1:length(lags))
##D           test.stat[i] <- -sum(diff(obj,lag=lags[i])^2)/sum(obj^2)
##D        test.stat
##D }	
##D portest(fit,lags=1:3,test="other",fn=fn,ncores=4) 
##D detach(package:car)
##D ## Time series regression 
##D fit.arima <- Arima(LakeHuron, order = c(2,0,0), xreg = time(LakeHuron)-1920)
##D portest(fit.arima,ncores=4)
##D #################################################################################
##D ## Monte-Carlo goodness-of-fit VAR test - Multivariate series                  ##
##D #################################################################################
##D data("IbmSp500")
##D ibm <- log(IbmSp500[,2]+1)*100
##D sp500 <- log(IbmSp500[,3]+1)*100
##D IBMSP500 <- data.frame(cbind(ibm,sp500))
##D ## ar.ols() function takes about 9.11 seconds
##D ans6 <-  ar.ols(IBMSP500, aic=FALSE, intercept=TRUE, order.max=5)
##D portest(ans6,nrep=100,test="MahdiMcLeod",ncores=4,innov.dist="t",dft=5)
##D ## VAR() function takes about 11.55 seconds
##D require("vars")
##D ans7 <- VAR(IBMSP500, p=5) 
##D portest(ans7,nrep=100,test="MahdiMcLeod",ncores=4,innov.dist="bootstrap")
##D portest(ans7,test="Hosking",MonteCarlo=FALSE) ## asymptotic Hosking test
##D detach(package:vars)
##D #################################################################################
##D ## Monte-Carlo test for models with heavy tails stable distributions           ##
##D #################################################################################
##D ## It takes about 32.7 seconds on personal PC with 4 CPUs 
##D data("CRSP")
##D CRSP.AR5<- arima(CRSP, c(5, 0, 0))
##D lags <- c(10, 20, 30)
##D portest(CRSP.AR5,lags=lags,ncores=4,nrep=1000,innov.dist="stable")   
##D #################################################################################
##D ## Monte-Carlo test for ARCH/GARCH effects using 4 CPUs                        ##
##D #################################################################################
##D ## It takes about 12.65 seconds
##D data("monthintel")
##D returns <- as.ts(monthintel)
##D lags <- c(5, 10, 20, 40)
##D portest(returns, lags = lags, ncores = 4, squared.residuals = FALSE)
##D portest(returns,lags=lags,ncores=4,squared.residuals=TRUE,innov.dist="t",dft=5)
##D #################################################################################
##D ## Monte-Carlo test for Threshold Autoregressive (TAR) Models                  ##
##D ## It takes about 54.27 seconds on personal PC with 4 CPUs                     ##
##D #################################################################################
##D require("TSA")
##D fit.model <- function(data){
##D     fit <- TSA::tar(y=log(data),p1=4,p2=4,d=3,a=0.1,b=0.9,print=FALSE)
##D     res <- ts(fit$std.res)
##D     parSpec <- list(res=res,fit=fit)
##D   parSpec
##D }
##D sim.model <- function(parSpec){
##D     fit <- parSpec$fit   
##D   exp(tar.sim(fit)$y)
##D }
##D data(prey.eq)
##D portest(fit.model(prey.eq),ncores=4,model=list(sim.model,fit.model),pkg.name="TSA")
##D detach(package:TSA)
## End(Not run)



