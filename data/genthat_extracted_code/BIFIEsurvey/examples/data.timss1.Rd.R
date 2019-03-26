library(BIFIEsurvey)


### Name: data.timss
### Title: Dataset TIMSS 2011
### Aliases: data.timss data.timss1 data.timss2 data.timssrep data.timss3
###   data.timss1.ind data.timss4
### Keywords: datasets

### ** Examples

## Not run: 
##D library(survey)
##D library(lavaan.survey)
##D library(intsvy)
##D library(mitools)
##D 
##D #############################################################################
##D # EXAMPLE 1: TIMSS dataset data.timss3 (one dataset including all PVs)
##D #############################################################################
##D 
##D data(data.timss2)
##D data(data.timss3)
##D data(data.timssrep)
##D 
##D # Analysis based on official 'single' datasets (data.timss3)
##D # There are 5 plausible values, but student covariates are not imputed.
##D 
##D #--- create object of class BIFIE data
##D bdat3 <- BIFIEsurvey::BIFIE.data(data.timss3, wgt=data.timss3$TOTWGT,
##D               wgtrep=data.timssrep[,-1], fayfac=1)
##D summary(bdat3)
##D # This BIFIEdata object contains one dataset in which all
##D # plausible values are included. This object can be used
##D # in analysis without plausible values.
##D # Equivalently, one can define bdat3 much simpler by
##D bdat3 <- BIFIEsurvey::BIFIE.data.jack(data.timss3, jktype="JK_TIMSS")
##D summary(bdat3)
##D 
##D #--- In the following, the object bdat4 is defined with 5 datasets
##D # referring to 5 plausible values.
##D bdat4 <- BIFIEsurvey::BIFIE.data.jack(data.timss3, pv_vars=c("ASMMAT","ASSSCI"),
##D                jktype="JK_TIMSS")
##D summary(bdat4)
##D 
##D #--- create object in survey package
##D dat3a <- as.data.frame( cbind( data.timss2[[1]], data.timssrep ) )
##D RR <- ncol(data.timssrep) - 1       # number of jackknife zones
##D svydes3 <- survey::svrepdesign(data=dat3a, weights=~TOTWGT, type="JKn",
##D                  repweights='w_fstr[0-9]', scale=1,  rscales=rep(1,RR), mse=TRUE)
##D summary(svydes3)
##D 
##D #--- create object with imputed datasets in survey
##D datL <- data.timss2
##D # include replicate weights in each dataset
##D for (ii in 1:5){
##D     dat1 <- datL[[ii]]
##D     dat1 <- cbind(  dat1, data.timssrep[,-1] )
##D     datL[[ii]] <- dat1
##D }
##D datL <- mitools::imputationList(list( datL[[1]],datL[[2]],datL[[3]],datL[[4]],datL[[5]]))
##D svydes4 <- survey::svrepdesign(data=datL, weights=~TOTWGT, type="JKn",
##D                    repweights='w_fstr[0-9]', scale=1,  rscales=rep(1,RR), mse=TRUE)
##D summary(svydes4)
##D 
##D #--- reconstruct data.timss3 for intsvy package. Plausible values must be labeled
##D # as PV01, PV02, ... and NOT PV1, PV2, ...
##D data.timss3a <- data.timss3
##D colnames(data.timss3a) <- gsub( "ASMMAT", "ASMMAT0", colnames(data.timss3a) )
##D colnames(data.timss3a) <- gsub( "ASSSCI", "ASSSCI0", colnames(data.timss3a) )
##D 
##D #***************************
##D # Model 1: Linear regression (no grouping variable)
##D 
##D #--- linear regression in survey
##D mod1a <-  survey::svyglm( scsci ~ migrant + books, design=svydes3)
##D summary(mod1a)
##D 
##D #--- regression with pirls.reg (intsvy)
##D mod1b <- intsvy::pirls.reg( y="scsci", x=c("migrant", "books" ), data=data.timss3)
##D mod1b
##D 
##D #---- regression with BIFIEsurvey
##D mod1c <- BIFIEsurvey::BIFIE.linreg( bdat3, dep="scsci", pre=c("one","migrant","books"))
##D summary(mod1c)
##D 
##D #--- regression with lavaan.survey package
##D lavmodel <- "
##D     scsci ~ migrant + books
##D     scsci ~ 1
##D     scsci ~~ scsci
##D         "
##D # fit in lavaan
##D lavaan.fit <- lavaan::lavaan( lavmodel, data=data.timss3, estimator="MLM")
##D summary(lavaan.fit)
##D # using all replicated weights
##D mod1d <- lavaan.survey::lavaan.survey(lavaan.fit=lavaan.fit, survey.design=svydes3 )
##D summary(mod1d)
##D 
##D #***************************
##D # Model 2: Linear regression (grouped by female)
##D 
##D #--- linear regression in survey
##D mod2a <- survey::svyglm( scsci ~ 0 + as.factor(female) + as.factor(female):migrant
##D                + as.factor(female):books, design=svydes3)
##D summary(mod2a)
##D 
##D #--- regression with pirls.reg (intsvy)
##D mod2b <- intsvy::pirls.reg( y="scsci", x=c("migrant", "books" ),
##D                  by="female", data=data.timss3)
##D mod2b[["0"]]   # regression coefficients female=0
##D mod2b[["1"]]   # regression coefficients female=1
##D 
##D #--- regression with BIFIEsurvey
##D mod2c <- BIFIEsurvey::BIFIE.linreg( bdat3, dep="scsci",
##D                pre=c("one","migrant","books"), group="female")
##D summary(mod2c)
##D 
##D #--- regression with lavaan.survey package
##D lavmodel <- "
##D     scsci ~ migrant + books
##D     scsci ~ 1
##D     scsci ~~ scsci
##D         "
##D # fit in lavaan
##D lavaan.fit <- lavaan::lavaan( lavmodel, data=data.timss3, group="female", estimator="MLM")
##D summary(lavaan.fit)
##D mod2d <- lavaan.survey::lavaan.survey(lavaan.fit=lavaan.fit, survey.design=svydes3 )
##D summary(mod2d)
##D 
##D #***************************
##D # Model 3: Linear regression with mathematics PVs
##D library(mitools)
##D 
##D #--- linear regression in survey
##D mod3a <- with(svydes4,  survey::svyglm( ASMMAT ~ migrant + books, design=svydes4 ) )
##D res3a <- mitools::MIcombine(mod3a)
##D summary(res3a)
##D 
##D #--- regression with pirls.reg.pv (intsvy)
##D mod3b <- intsvy::pirls.reg.pv( pvlabel="ASMMAT", x=c("migrant", "books" ),
##D              data=data.timss3a)
##D 
##D #--- regression with BIFIEsurvey
##D mod3c <- BIFIEsurvey::BIFIE.linreg( bdat4, dep="ASMMAT", pre=c("one","migrant","books"))
##D summary(mod3c)
##D 
##D #--- regression with lavaan.survey package
##D lavmodel <- "
##D     ASMMAT ~ migrant + books
##D     ASMMAT ~ 1
##D     ASMMAT ~~ ASMMAT
##D         "
##D # fit in lavaan
##D lavaan.fit <- lavaan::lavaan( lavmodel, data=data.timss3a, group="female", estimator="MLM")
##D summary(lavaan.fit)
##D mod3d <- lavaan.survey::lavaan.survey(lavaan.fit=lavaan.fit, survey.design=svydes4 )
##D summary(mod3d)
##D 
##D #############################################################################
##D # EXAMPLE 2: TIMSS dataset data.timss4 | Nested multiply imputed dataset
##D #############################################################################
##D 
##D data(data.timss4)
##D data(data.timssrep)
##D 
##D #**** create BIFIEdata object
##D bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss4, wgt=data.timss4[[1]][[1]]$TOTWGT,
##D                wgtrep=data.timssrep[, -1 ], NMI=TRUE, cdata=TRUE )
##D summary(bdat)
##D 
##D #**** Model 1: Linear regression for mathematics score
##D mod1 <- BIFIEsurvey::BIFIE.linreg( bdat, dep="ASMMAT", pre=c("one","books","migrant"))
##D summary(mod1)
##D 
##D #*** Model 2: Univariate statistics ?BIFIEsurvey::BIFIE.univar
##D mod2 <- BIFIEsurvey::BIFIE.univar( bdat, vars=c("ASMMAT","ASSSCI","books") )
##D summary(mod2)
## End(Not run)



