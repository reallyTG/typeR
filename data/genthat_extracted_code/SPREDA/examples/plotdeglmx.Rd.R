library(SPREDA)


### Name: plotdeglmx
### Title: Plot function for the class of "deglmx".
### Aliases: plotdeglmx

### ** Examples

 data(Coatingenv)
 data(Coatingout)
 
 ## No test: 
 fit=deglmx(DAMAGE_Y~UV+RH+TEMP, data=Coatingout, dyn.data=Coatingenv, 
           id="SPEC_NUM", time="TIME", random=~TIME|SPEC_NUM, linear=TRUE, ytrend=-1,  
           splinetrend=c(-1, -1, -1), splinetype=c("Is", "Cs", "Is"), degree=c( 3, 3, 3), 
           knots=c(4, 4, 4),weights=NULL, subset=NULL,start=c(0.017,0.0013,-0.404,0.0176), 
           maxiter=10, method='BFGS')
 plotdeglmx(x=fit)
 plotdeglmx(x=fit, type=1)
 plotdeglmx(x=fit, type=1)
     
## End(No test)



