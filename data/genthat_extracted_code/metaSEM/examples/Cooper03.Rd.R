library(metaSEM)


### Name: Cooper03
### Title: Selected effect sizes from Cooper et al. (2003)
### Aliases: Cooper03
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Cooper03)
##D 
##D #### ML estimation method
##D ## No predictor
##D summary( model1 <- meta3(y=y, v=v, cluster=District, data=Cooper03) )
##D 
##D ## Show all heterogeneity indices and their 95% confidence intervals
##D summary( meta3(y=y, v=v, cluster=District, data=Cooper03,
##D                intervals.type="LB", I2=c("I2q", "I2hm", "I2am", "ICC")) )
##D 
##D ## Year as a predictor
##D summary( meta3(y=y, v=v, cluster=District, x=scale(Year, scale=FALSE),
##D                data=Cooper03, model.name="Year as a predictor") )
##D 
##D ## Equality of level-2 and level-3 heterogeneity
##D summary( model2 <- meta3(y=y, v=v, cluster=District, data=Cooper03,
##D                          RE2.constraints="0.2*EqTau2",
##D                          RE3.constraints="0.2*EqTau2",
##D                          model.name="Equal Tau2") )
##D 
##D ## Compare model2 vs. model1
##D anova(model1, model2)
##D 
##D #### REML estimation method
##D ## No predictor
##D summary( reml3(y=y, v=v, cluster=District, data=Cooper03) )
##D 
##D ## Level-2 and level-3 variances are constrained equally 
##D summary( reml3(y=y, v=v, cluster=District, data=Cooper03,
##D                RE.equal=TRUE, model.name="Equal Tau2") )
##D 
##D ## Year as a predictor
##D summary( reml3(y=y, v=v, cluster=District, x=scale(Year, scale=FALSE),
##D                data=Cooper03, intervals.type="LB") )
##D 
##D ## Handling missing covariates with FIML
##D ## Create 20/56 MCAR data in Year
##D set.seed(10000)
##D Year_MCAR <- Cooper03$Year
##D Year_MCAR[sample(56, 20)] <- NA
##D summary( meta3X(y=y, v=v, cluster=District, x2=scale(Year_MCAR, scale=FALSE),
##D                 data=Cooper03, model.name="NA in Year_MCAR") )
## End(Not run)



