library(BIFIEsurvey)


### Name: BIFIEdata2svrepdesign
### Title: Conversion of a 'BIFIEdata' Object into a 'svyrep' Object in the
###   'survey' Package
### Aliases: BIFIEdata2svrepdesign

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: One dataset, TIMSS replication design
##D #############################################################################
##D 
##D data(data.timss3)
##D data(data.timssrep)
##D 
##D #--- create BIFIEdata object
##D bdat3 <- BIFIEsurvey::BIFIE.data.jack(data.timss3, jktype="JK_TIMSS")
##D summary(bdat3)
##D 
##D #--- create survey object directly in survey package
##D dat3a <- as.data.frame( cbind( data.timss3, data.timssrep ) )
##D RR <- ncol(data.timssrep) - 1       # number of jackknife zones
##D svydes3a <- survey::svrepdesign(data=dat3a, weights=~TOTWGT,type="JKn",
##D                  repweights='w_fstr[0-9]', scale=1,  rscales=rep(1,RR), mse=TRUE )
##D print(svydes3a)
##D 
##D #--- create survey object by converting the BIFIEdata object to survey
##D svydes3b <- BIFIEsurvey::BIFIEdata2svrepdesign(bdat3)
##D 
##D #*** compare results for the mean in Mathematics scores
##D mod1a <- BIFIEsurvey::BIFIE.univar( bdat3, vars="ASMMAT1")
##D mod1b <- survey::svymean( ~ ASMMAT1, design=svydes3a )
##D mod1c <- survey::svymean( ~ ASMMAT1, design=svydes3b )
##D 
##D #- coefficients
##D coef(mod1a); coef(mod1b); coef(mod1c)
##D #- standard errors
##D survey::SE(mod1a); survey::SE(mod1b); survey::SE(mod1c)
##D 
##D #############################################################################
##D # EXAMPLE 2: Multiply imputed datasets, TIMSS replication design
##D #############################################################################
##D 
##D data(data.timss2)
##D data(data.timssrep)
##D 
##D #--- create BIFIEdata object
##D bdat4 <- BIFIEsurvey::BIFIE.data( data=data.timss2, wgt="TOTWGT",
##D               wgtrep=data.timssrep[,-1], fayfac=1)
##D print(bdat4)
##D 
##D #--- create object with imputed datasets in survey
##D datL <- mitools::imputationList( data.timss2 )
##D RR <- ncol(data.timssrep) - 1
##D weights <- data.timss2[[1]]$TOTWGT
##D repweights <-  data.timssrep[,-1]
##D svydes4a <- survey::svrepdesign(data=datL, weights=weights, type="other",
##D                repweights=repweights, scale=1,  rscales=rep(1,RR), mse=TRUE)
##D print(svydes4a)
##D 
##D #--- create BIFIEdata object with conversion function
##D svydes4b <- BIFIEsurvey::BIFIEdata2svrepdesign(bdat4)
##D 
##D #*** compare results for a mean
##D mod1a <- BIFIEsurvey::BIFIE.univar(bdat4, vars="ASMMAT")
##D mod1b <- mitools::MIcombine( with(svydes4a, survey::svymean( ~ ASMMAT, design=svydes4a )))
##D mod1c <- mitools::MIcombine( with(svydes4b, survey::svymean( ~ ASMMAT, design=svydes4b )))
##D # results
##D coef(mod1a); coef(mod1b); coef(mod1c)
##D survey::SE(mod1a); survey::SE(mod1b); survey::SE(mod1c)
## End(Not run)



