library(metaSEM)


### Name: Hox02
### Title: Simulated Effect Sizes Reported by Hox (2002)
### Aliases: Hox02
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Hox02)
##D 
##D #### ML estimation method
##D ## Random-effects meta-analysis
##D summary( meta(y=yi, v=vi, data=Hox02, I2=c("I2q", "I2hm"), intervals.type="LB") ) 
##D 
##D ## Fixed-effects meta-analysis
##D summary( meta(y=yi, v=vi, data=Hox02, RE.constraints=0,
##D               model.name="Fixed effects model") )
##D 
##D ## Mixed-effects meta-analysis with "weeks" as a predictor
##D ## Request likelihood-based CI
##D summary( meta(y=yi, v=vi, x=weeks, data=Hox02, intervals.type="LB",
##D               model.name="Mixed effects meta analysis with LB CI") )
##D 
##D #### REML estimation method
##D ## Random-effects meta-analysis with REML
##D summary( VarComp <- reml(y=yi, v=vi, data=Hox02) )
##D 
##D ## Extract the variance component
##D VarComp_REML <- matrix( coef(VarComp), ncol=1, nrow=1 )
##D 
##D ## Meta-analysis by treating the variance component as fixed
##D summary( meta(y=yi, v=vi, data=Hox02, RE.constraints=VarComp_REML) )
##D 
##D 
##D ## Mixed-effects meta-analysis with "weeks" as a predictor
##D ## Request Wald CI
##D summary( reml(y=yi, v=vi, x=weeks, intervals.type="z",
##D               data=Hox02, model.name="REML with LB CI") )
## End(Not run)



