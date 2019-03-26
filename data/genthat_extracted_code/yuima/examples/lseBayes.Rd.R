library(yuima)


### Name: lseBayes
### Title: Adaptive Bayes estimator for the parameters in sde model by
###   using LSE functions
### Aliases: lseBayes lseBayes,yuima-method
### Keywords: ts

### ** Examples

## Not run: 
##D ####2-dim model
##D set.seed(123)
##D 
##D b <- c("-theta1*x1+theta2*sin(x2)+50","-theta3*x2+theta4*cos(x1)+25")
##D a <- matrix(c("4+theta5*sin(x1)^2","1","1","2+theta6*sin(x2)^2"),2,2)
##D 
##D true = list(theta1 = 0.5, theta2 = 5,theta3 = 0.3, 
##D             theta4 = 5, theta5 = 1, theta6 = 1)
##D lower = list(theta1=0.1,theta2=0.1,theta3=0,
##D              theta4=0.1,theta5=0.1,theta6=0.1)
##D upper = list(theta1=1,theta2=10,theta3=0.9,
##D              theta4=10,theta5=10,theta6=10)
##D start = list(theta1=runif(1), 
##D              theta2=rnorm(1),
##D              theta3=rbeta(1,1,1), 
##D              theta4=rnorm(1),
##D              theta5=rgamma(1,1,1), 
##D              theta6=rexp(1))
##D 
##D yuimamodel <- setModel(drift=b,diffusion=a,state.variable=c("x1", "x2"),solve.variable=c("x1","x2"))
##D yuimasamp <- setSampling(Terminal=50,n=50*100)
##D yuima <- setYuima(model = yuimamodel, sampling = yuimasamp)
##D yuima <- simulate(yuima, xinit = c(100,80),
##D                   true.parameter = true,sampling = yuimasamp)
##D 
##D prior <-
##D     list(
##D         theta1=list(measure.type="code",df="dunif(z,0,1)"),
##D         theta2=list(measure.type="code",df="dnorm(z,0,1)"),
##D         theta3=list(measure.type="code",df="dbeta(z,1,1)"),
##D         theta4=list(measure.type="code",df="dgamma(z,1,1)"),
##D         theta5=list(measure.type="code",df="dnorm(z,0,1)"),
##D         theta6=list(measure.type="code",df="dnorm(z,0,1)")
##D     )
##D 
##D 
##D mle <- qmle(yuima, start = start, lower = lower, upper = upper, method = "L-BFGS-B",rcpp=TRUE) 
##D print(mle@coef)
##D set.seed(123)
##D bayes1 <- lseBayes(yuima, start=start, prior=prior,
##D                                     method="mcmc",
##D                                     mcmc=1000,lower = lower, upper = upper,algorithm = "randomwalk")
##D bayes1@coef
##D set.seed(123)
##D bayes2 <- lseBayes(yuima, start=start, prior=prior,
##D                                     method="mcmc",
##D                                     mcmc=1000,lower = lower, upper = upper,algorithm = "MpCN")
##D bayes2@coef
##D 
## End(Not run)



