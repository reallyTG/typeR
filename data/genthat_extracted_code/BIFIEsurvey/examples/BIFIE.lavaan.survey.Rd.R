library(BIFIEsurvey)


### Name: BIFIE.lavaan.survey
### Title: Fitting a Model in 'lavaan' or in 'survey'
### Aliases: BIFIE.lavaan.survey summary.BIFIE.lavaan.survey
###   coef.BIFIE.lavaan.survey vcov.BIFIE.lavaan.survey BIFIE.survey
###   summary.BIFIE.survey coef.BIFIE.survey vcov.BIFIE.survey

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Multiply imputed datasets, TIMSS replication design
##D #############################################################################
##D 
##D library(lavaan)
##D data(data.timss2)
##D data(data.timssrep)
##D 
##D #--- create BIFIEdata object
##D bdat4 <- BIFIEsurvey::BIFIE.data( data=data.timss2, wgt="TOTWGT",
##D                 wgtrep=data.timssrep[,-1], fayfac=1)
##D print(bdat4)
##D 
##D #--- create survey object with conversion function
##D svydes4 <- BIFIEsurvey::BIFIEdata2svrepdesign(bdat4)
##D 
##D #*** regression model
##D mod1 <- BIFIEsurvey::BIFIE.linreg(bdat4, formula=ASMMAT ~ ASSSCI )
##D mod2 <- mitools::MIcombine( with(svydes4, survey::svyglm( formula=ASMMAT ~ ASSSCI,
##D                        design=svydes4 )))
##D #--- regression with lavaan.survey package
##D lavmodel <- "ASMMAT ~ 1
##D              ASMMAT ~ ASSSCI"
##D mod3 <- BIFIEsurvey::BIFIE.lavaan.survey(lavmodel, svyrepdes=svydes4)
##D # inference included in lavaan.survey package
##D mod4 <- BIFIEsurvey::BIFIE.lavaan.survey(lavmodel, svyrepdes=svydes4,
##D                         lavaan_survey_default=TRUE)
##D summary(mod3)
##D # extract fit statistics
##D lavaan::fitMeasures(mod3$lavfit)
##D 
##D #--- use BIFIE.lavaan.survey function with BIFIEdata object
##D mod5 <- BIFIEsurvey::BIFIE.lavaan.survey(lavmodel, svyrepdes=bdat4)
##D summary(mod5)
##D 
##D # compare estimated parameters
##D coef(mod1); coef(mod2); coef(mod3); coef(mod4); coef(mod5)
##D 
##D # compare standard error estimates
##D se(mod1); se(mod2); se(mod3); se(mod4); se(mod5)
##D 
##D #############################################################################
##D # EXAMPLE 2: Examples BIFIE.survey function
##D #############################################################################
##D 
##D data(data.timss2)
##D data(data.timssrep)
##D 
##D #--- create BIFIEdata object
##D bdat <- BIFIEsurvey::BIFIE.data( data=data.timss2, wgt="TOTWGT",
##D               wgtrep=data.timssrep[,-1], fayfac=1)
##D print(bdat)
##D                                         
##D #--- survey object
##D sdat <- BIFIEsurvey::BIFIEdata2svrepdesign(bdat)
##D print(sdat)
##D 
##D #- fit models in survey
##D mod1 <- BIFIEsurvey::BIFIE.linreg(bdat, formula=ASMMAT~ASSSCI)
##D mod2 <- BIFIEsurvey::BIFIE.survey( sdat, survey.function=survey::svyglm, formula=ASMMAT~ASSSCI)
##D mod3 <- BIFIEsurvey::BIFIE.survey( bdat, survey.function=survey::svyglm, formula=ASMMAT~ASSSCI)
##D summary(mod1)
##D summary(mod2)
##D summary(mod3)
## End(Not run)



