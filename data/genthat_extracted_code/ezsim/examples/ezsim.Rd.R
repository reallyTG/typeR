library(ezsim)


### Name: ezsim
### Title: Create an ezsim Object.
### Aliases: dgp ezsim

### ** Examples

## Not run: 
##D ## Example 1
##D ezsim_basic<-ezsim(
##D     m             = 100,
##D     run           = TRUE,
##D     display_name  = c(mean_hat="hat(mu)",sd_mean_hat="hat(sigma[hat(mu)])"),
##D     parameter_def = createParDef(list(n=seq(20,80,20),mu=c(0,2),sigma=c(1,3,5))),
##D     dgp           = function() rnorm(n,mu,sigma),
##D     estimator     = function(x) c(mean_hat = mean(x),
##D                                  sd_mean_hat=sd(x)/sqrt(length(x)-1)),
##D     true_value    = function() c(mu, sigma / sqrt(n-1))
##D )
##D 
##D ## Test whether an ezsim object is valid.
##D ## Print the result of the test and dont return the name of estimator.
##D test(ezsim_basic,print_result=TRUE,return_name=FALSE)
##D 
##D ## Summary of an ezsim object
##D summary(ezsim_basic)
##D 
##D ## Summary of a subset of ezsim object
##D summary(ezsim_basic,subset=list(estimator='mean_hat',n=c(20,40),sigma=c(1,3)))
##D 
##D ## More Summary Statistics
##D summary(ezsim_basic,simple=FALSE,subset=list(estimator='mean_hat',n=c(20,40),sigma=c(1,3)))
##D 
##D ## Customize the Summary Statistics
##D summary(ezsim_basic,stat=c("q25","median","q75"),Q025=quantile(value_of_estimator,0.025),
##D   Q975=quantile(value_of_estimator,0.975),subset=list(estimator='mean_hat',n=c(20,40),sigma=c(1,3)))
##D 
##D ## Plot an ezsim object
##D plot(ezsim_basic)
##D ## Subet of the Plot
##D plot(ezsim_basic,subset=list(estimator="sd_mean_hat",mu=0))
##D plot(ezsim_basic,subset=list(estimator="mean_hat",sigma=3))
##D ## Parameters Priority of the Plot
##D plot(ezsim_basic,subset=list(estimator="sd_mean_hat",mu=0),parameters_priority=c("sigma","n"))
##D plot(ezsim_basic,subset=list(estimator="mean_hat",sigma=c(1,3)),parameters_priority="mu")
##D 
##D ## Density Plot
##D plot(ezsim_basic,'density')
##D plot(ezsim_basic,"density",subset=list(estimator="mean_hat",sigma=3),parameters_priority="n",
##D   benchmark=dnorm)
##D plot(ezsim_basic,"density",subset=list(estimator="mean_hat",mu=0),parameters_priority="n" ,
##D   benchmark=dnorm)
##D 
##D ## Plot the summary ezsim
##D plot(summary(ezsim_basic,c("q25","q75")))
##D plot(summary(ezsim_basic,c("q25","q75"),subset=list(estimator='mean_hat')))
##D plot(summary(ezsim_basic,c("median"),subset=list(estimator='sd_mean_hat')))
##D 
##D ## Example 2
##D ezsim_ols<-ezsim(
##D     m             = 100,
##D     run           = TRUE,
##D     display_name  = c(beta_hat='hat(beta)',es='sigma[e]^2',xs='sigma[x]^2',
##D 	                      sd_beta_hat='hat(sigma)[hat(beta)]'),
##D     parameter_def = createParDef(selection=list(xs=c(1,3),beta=c(0,2),n=seq(20,80,20),es=c(1,3))),
##D     dgp           = function(){
##D                         x<-rnorm(n,0,xs)
##D                         e<-rnorm(n,0,es)
##D                         y<-beta * x + e
##D                         data.frame(y,x)
##D                     },
##D     estimator     = function(d){
##D                         r<-summary(lm(y~x-1,data=d))
##D                         out<-r$coef[1,1:2]
##D                         names(out)<-c('beta_hat','sd_beta_hat')
##D                         out
##D                     },
##D     true_value    = function() c(beta, es/sqrt(n)/xs)
##D )
##D summary(ezsim_ols)
##D plot(ezsim_ols)
##D plot(ezsim_ols,subset=list(beta=0))
##D 
##D plot(ezsim_ols,'density')
##D plot(ezsim_ols,'density',subset=list(es=1,xs=1))
##D 
##D 
##D ## example 3
##D ezsim_powerfun<-ezsim(
##D     run           = TRUE,
##D     m             = 100,
##D     parameter_def = createParDef(selection=list(xs=1,n=50,es=c(1,5),b=seq(-1,1,0.1))),
##D     display_name  = c(b='beta',es='sigma[e]^2',xs='sigma[x]^2'),
##D     dgp           = function(){
##D                         x<-rnorm(n,0,xs)
##D                         e<-rnorm(n,0,es)
##D                         y<-b * x + e
##D                         data.frame(y,x)
##D                     },
##D     estimator     = function(d){
##D                         r<-summary(lm(y~x-1,data=d))
##D                         stat<-r$coef[,1]/r$coef[,2]
##D 
##D                         # test whether b > 0
##D                         # level of significance : 5%
##D                         out <- stat > c(qnorm(.95), qt(0.95,df=r$df[2]))
##D                         names(out)<-c("z-test","t-test")
##D                         out
##D                     }
##D )
##D plot(ezsim_powerfun,'powerfun')
## End(Not run)



