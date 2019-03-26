library(SPREDA)


### Name: deglmx
### Title: Functions for estimating parameters in the linear/nonlinear
###   mixed models with dynamic covariates.
### Aliases: deglmx clme data.pre.fun getCov getnames getRanName
###   match.dat.fun minus.log.lik.nlme minus.loglik.lme mle.obj.to.fit.obj
###   optim.ftn.2 optim.step1.2 optim.step2.2 plot.MICsplines print.deglmx
###   sqrt_mat Px xmat.obj.to.xmat xmat.to.cumsum coefinitial.ftn
###   coef.deglmx.MLE

### ** Examples

 data(Coatingenv)
 data(Coatingout)
 
 ## No test: 
 fit=deglmx(DAMAGE_Y~UV+RH+TEMP, data=Coatingout, dyn.data=Coatingenv, 
           id="SPEC_NUM", time="TIME", random=~TIME|SPEC_NUM, linear=TRUE, ytrend=-1,  
           splinetrend=c(-1, -1, -1), splinetype=c("Is", "Cs", "Is"), degree=c( 3, 3, 3), 
           knots=c(4, 4, 4), weights=NULL, subset=NULL,start=c(0.017,0.0013,-0.404,0.0176), 
           maxiter=10, method='BFGS')
           
 fit=deglmx(DAMAGE_Y~G/(1+exp(-log(UV+RH+TEMP)/H)), data=Coatingout, dyn.data=Coatingenv, 
           id="SPEC_NUM", time="TIME", random=~G+H|SPEC_NUM, linear=FALSE, ytrend=-1,  
           splinetrend=c(1, 1, 1), splinetype=c("Is", "Cs", "Is"), degree=c( 3, 3, 3), 
           knots=c(4, 4, 4), weights=NULL, subset=NULL, start=c(0.1, 0.1, -0.5, 0.01), 
           maxiter=4)
         
## End(No test)



