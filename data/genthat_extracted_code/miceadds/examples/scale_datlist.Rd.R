library(miceadds)


### Name: scale_datlist
### Title: Adding a Standardized Variable to a List of Multiply Imputed
###   Datasets or a Single Datasets
### Aliases: scale_datlist
### Keywords: z-Standardization

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Standardized variables in list of multiply imputed datasets
##D #############################################################################
##D 
##D data(data.ma02)
##D datlist <- data.ma02
##D 
##D #--- object of class 'datlist'
##D datlist <- miceadds::datlist_create( datlist )
##D 
##D # mean and SD of variable hisei
##D miceadds::ma.wtd.meanNA(data=datlist, weights=datlist[[1]]$studwgt, vars="hisei" )
##D mean( unlist( lapply( datlist, FUN=function(data){
##D         stats::weighted.mean( data$hisei, data$studwgt )  } ) ) )
##D miceadds::ma.wtd.sdNA(data=datlist, weights=datlist[[1]]$studwgt, vars="hisei" )
##D mean( unlist( lapply( datlist, FUN=function(data){
##D         sqrt( Hmisc::wtd.var( data$hisei, data$studwgt ) ) } ) ) )
##D 
##D # standardize variable hisei to M=100 and SD=15
##D datlist1a <- miceadds::scale_datlist( datlist=datlist, orig_var="hisei",
##D                trafo_var="hisei100", weights=datlist[[1]]$studwgt, M=100, SD=15 )
##D 
##D # check mean and SD
##D miceadds::ma.wtd.meanNA(data=datlist1a, weights=datlist[[1]]$studwgt, vars="hisei100")
##D miceadds::ma.wtd.sdNA(data=datlist1a, weights=datlist[[1]]$studwgt, vars="hisei100")
##D 
##D #--- do standardization for unweighted sample with books <=3
##D # -> define a weighting variable at first
##D datlist0 <- mitools::imputationList( datlist )
##D datlist2a <- miceadds::within.imputationList( datlist0, {
##D              # define weighting variable
##D                  wgt_books <- 1 * ( books <=3 )
##D                     } )
##D 
##D # standardize variable hisei to M=100 and SD=15 with respect to weighting variable
##D datlist2b <- miceadds::scale_datlist( datlist=datlist2a, orig_var="hisei", trafo_var="hisei100",
##D          weights="wgt_books", M=100, SD=15 )
##D 
##D # check mean and SD (groupwise)
##D miceadds::ma.wtd.meanNA(data=datlist1a, weights=datlist[[1]]$studwgt, vars="hisei100")
##D miceadds::ma.wtd.sdNA(data=datlist1a, weights=datlist[[1]]$studwgt, vars="hisei100")
##D 
##D #--- transformation for a single dataset
##D dat0 <- datlist[[1]]
##D dat0a <- miceadds::scale_datlist( datlist=dat0, orig_var="hisei", trafo_var="hisei100",
##D                     weights=dat0$studwgt, M=100, SD=15 )
##D stats::weighted.mean( dat0a[,"hisei"],  w=dat0a$studwgt )
##D stats::weighted.mean( dat0a[,"hisei100"],  w=dat0a$studwgt )
##D sqrt( Hmisc::wtd.var( dat0a[,"hisei100"],  weights=dat0a$studwgt ) )
##D 
##D #--- Standardizations for objects of class imputationList
##D datlist2 <- mitools::imputationList(datlist)   # object class conversion
##D datlist2a <- miceadds::scale_datlist( datlist=datlist2, orig_var="hisei",
##D                  trafo_var="hisei100", weights=datlist[[1]]$studwgt, M=100, SD=15 )
##D 
##D #############################################################################
##D # EXAMPLE 2: Standardized variables in list of nested multiply imputed datasets
##D #############################################################################
##D 
##D # nested multiply imputed dataset in BIFIEsurvey package
##D data(data.timss4, package="BIFIEsurvey")
##D datlist <- data.timss4
##D wgt <- datlist[[1]][[1]]$TOTWGT
##D 
##D # class nested.datlist
##D imp1 <- miceadds::nested.datlist_create( datlist )
##D # class NestedImputationList
##D imp2 <- miceadds::NestedImputationList( datlist )
##D 
##D # standardize variable scsci
##D imp1a <- miceadds::scale_datlist( datlist=imp1, orig_var="scsci", trafo_var="zscsci", weights=wgt)
##D # check descriptives
##D miceadds::ma.wtd.meanNA( imp1a, weights=wgt, vars=c("scsci", "zscsci" ) )
##D miceadds::ma.wtd.sdNA( imp1a, weights=wgt, vars=c("scsci", "zscsci" ) )
##D 
##D #############################################################################
##D # EXAMPLE 3: Standardization of variables for imputed data in mice package
##D #############################################################################
##D 
##D data(nhanes, package="mice")
##D set.seed(76)
##D 
##D #--- impute nhanes data
##D imp <- mice::mice(nhanes)
##D #--- convert into datlist
##D datlist <- miceadds::mids2datlist(imp)
##D #--- scale datlist (all variables)
##D vars <- colnames(nhanes)
##D sdatlist <- miceadds::scale_datlist(datlist, orig_var=vars, trafo_var=paste0("z",vars) )
##D #--- reconvert to mids object
##D imp2 <- miceadds::datlist2mids(sdatlist)
##D #*** compare descriptive statistics of objects
##D round( miceadds::mean0( mice::complete(imp, action=1) ), 2 )
##D round( miceadds::mean0( mice::complete(imp2, action=1) ), 2 )
## End(Not run)



