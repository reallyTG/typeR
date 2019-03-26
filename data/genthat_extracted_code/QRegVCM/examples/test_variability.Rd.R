library(QRegVCM)


### Name: test_variability
### Title: Variability Estimation and Testing
### Aliases: test_variability

### ** Examples

############################################################################
##### The real data Example in Section S3 of the supplementary material
############################################################################
data(PM10)
PM10 = PM10[order(PM10$day,PM10$hour,decreasing=FALSE),]

y = PM10$PM10 ## the logarithm of the concentration of PM10
times = PM10$hour  ## the time in hours
subj = PM10$day  ## subject indicator (day)
dim=length(y) ## number of rows in the data = 500
x0 = rep(1,dim) ## for intercept
# the covariates
x1 = PM10$cars ## logarithm of number of cars per hour
x2 = PM10$wind.speed ## the wind speed (in meters/second)
x3 = PM10$temp ## the temperature (in degree Celsius)
X = cbind(x0, x1, x2, x3) ## the covariate matrix
px=ncol(X)

##########################
### Input parameters ####
#########################
lambda = 1 # used 10^seq(-2, 1, 0.1) in Gijbels etal (2017)
kn = rep(3,px) # used rep(10,px) in Gijbels etal (2017)
degree = rep(3,px)
d = rep(1,px)
gam=0.25
nr.bootstrap.samples= 4 # used 200 in Gijbels etal (2017)
seed=110
taus = 0.1
#########################

test1=test_variability(times=times, subj=subj, X=X, y=y, d=d, kn=kn,
                       degree=degree, lambda=lambda, gam=gam, tau=taus,
                       nr.bootstrap.samples=nr.bootstrap.samples,seed=seed,
                       test="Y",model=4)
#### Testing results
test1$comp  #the comparisons
test1$P  ## p-values
test1$GR ## test statistics

### estimation results
qhat5_s2_m4=test1$qhat5_s2_m4
qhat5_s2_m5=test1$qhat5_s2_m5
qhat5_s2_m0=test1$qhat5_s2_m0*rep(1,dim)
gamma0=test1$hat_btV_4[1:dim]
gamma1=test1$hat_btV_4[(dim+1):(dim*2)]
gamma2=test1$hat_btV_4[(dim*2+1):(dim*3)]
gamma3=test1$hat_btV_4[(dim*3+1):(dim*4)]

i = order(times, qhat5_s2_m4, qhat5_s2_m5, qhat5_s2_m0,gamma0,gamma1,
gamma2,gamma3);
times_o = times[i];  qhat5_s2_m4_o=qhat5_s2_m4[i];
qhat5_s2_m5_o=qhat5_s2_m5[i]; qhat5_s2_m0_o=qhat5_s2_m0[i]; gamma0_o=gamma0[i];
gamma1_o=gamma1[i]; gamma2_o=gamma2[i];gamma3_o=gamma3[i]

#####  variability functions plots
plot(qhat5_s2_m4_o~times_o, col="magenta", cex=0.2,
xlab="hour", ylab="estimated variability function")
lines(qhat5_s2_m5_o~times_o, col="red", cex=0.2, lty=1, lwd=2);
lines(qhat5_s2_m0_o~times_o, col="black", cex=0.2, lty=5, lwd=2);
legend("topleft", c("Model 4", "Model 5", "Model 0"), ncol=1,
        col=c("magenta","red","black"), lwd=c(1,2,2), lty=c(3,1,5))

### Plot of coefficients for variability function
plot(gamma0_o~times_o, lwd=2, type="l", xlab="hour",
ylab=expression(hat(gamma)(T)));
plot(gamma1_o~times_o, lwd=2, type="l", xlab="hour",
ylab="coefficient of logarithm of number of cars per hour");
plot(gamma2_o~times_o, lwd=2, type="l", xlab="hour",
ylab="coefficient of wind speed");
plot(gamma3_o~times_o, lwd=2, type="l", xlab="hour",
ylab="coefficient of temperature")

## Not run: 
##D ###############################################################################
##D ###############  The real data Example in Section 6 of Gijbels etal (2017)
##D ###############################################################################
##D data(CD4)
##D 
##D subj = CD4$subj ## subject indicator (a man)
##D dim = length(subj) ## number of rows in the data = 1817
##D y = CD4$CD4 ## the CD4 percentage
##D X0 = rep(1,dim) ## the intercept
##D X1 = CD4$Smooking ## the smoking status
##D X2 = CD4$Age ## age at HIV infection
##D X3 = CD4$PreCD4 ## the pre-infection CD4 percentage
##D times = CD4$Time ## the time in years
##D X = cbind(X0, X1, X2, X3) ## the covariate matrix
##D px=ncol(X)
##D 
##D lambdas = c(0.01,1,10) # used 10^seq(-2, 1, 0.1) in Gijbels etal (2017)
##D kn = rep(10,px) # the number of internal knots for each covariate
##D degree = rep(3,px) # the degree of splines
##D d = rep(1,px) ## The differencing order in the penalty term for each covariate
##D gam=0.25  ## the smooting parameter for each covariate
##D nr.bootstrap.samples=100 ## used 200 in Gijbels etal (2017)
##D seed=110 ## the seed for the random generator in the bootstrap resampling
##D taus = seq(0.1,0.9,0.2)
##D 
##D test2=test_variability(times=times, subj=subj, X=X, y=y, d=d, kn=kn,
##D                          degree=degree, lambda=lambdas, gam=gam,tau=taus,
##D                          nr.bootstrap.samples=nr.bootstrap.samples,seed=seed,
##D                          test="Y",model=4)
##D 
##D test2$comp
##D test2$P  ## p-values
##D test2$GR ## test statistics
##D 
##D ### estimation results
##D   qhat5_s2_m4=test2$qhat5_s2_m4
##D   qhat5_s2_m5=test2$qhat5_s2_m5
##D   qhat5_s2_m0=test2$qhat5_s2_m0*rep(1,dim)
##D   gamma0=test2$hat_btV_4[1:dim]
##D   gamma1=test2$hat_btV_4[(dim+1):(dim*2)]
##D   gamma2=test2$hat_btV_4[(dim*2+1):(dim*3)]
##D   gamma3=test2$hat_btV_4[(dim*3+1):(dim*4)]
##D 
##D i = order(times, qhat5_s2_m4, qhat5_s2_m5, qhat5_s2_m0,gamma0,gamma1,
##D             gamma2,gamma3);
##D times_o = times[i];  qhat5_s2_m4_o=qhat5_s2_m4[i]; qhat5_s2_m5_o=qhat5_s2_m5[i]
##D qhat5_s2_m0_o=qhat5_s2_m0[i]; gamma0_o=gamma0[i]; gamma1_o=gamma1[i];
##D gamma2_o=gamma2[i];gamma3_o=gamma3[i]
##D 
##D #####  variability functions plots
##D plot(qhat5_s2_m4_o~times_o, col="black", cex=0.2, xlab="time since infection",
##D ylab="estimated variability function")
##D lines(qhat5_s2_m5_o~times_o, col="red", cex=0.2, lty=5, lwd=2);
##D lines(qhat5_s2_m0_o~times_o, col="magenta", cex=0.2, lty=1, lwd=2);
##D legend("topleft", c("Model 4", "Model 5", "Model 0"),
##D          ncol=1, col=c("black","red","magenta"),
##D          lwd=c(1,2,2), lty=c(3,5,1))
##D 
##D ### Plot of coefficients for variability function
##D plot(gamma0_o~times_o, lwd=2, type="l", xlab="time since infection",
##D ylab=expression(hat(gamma)(T)));
##D plot(gamma1_o~times_o, lwd=2, type="l", xlab="time since infection",
##D ylab="coefficient of smoking status");
##D plot(gamma2_o~times_o, lwd=2, type="l", xlab="time since infection",
##D ylab="coefficient of age");
##D plot(gamma3_o~times_o, lwd=2, type="l", xlab="time since infection",
##D ylab="coefficient of pre-infection CD4")
## End(Not run)



