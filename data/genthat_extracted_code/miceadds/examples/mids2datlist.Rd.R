library(miceadds)


### Name: mids2datlist
### Title: Converting a 'mids', 'mids.1chain' or 'mids.nmi' Object in a
###   Dataset List
### Aliases: mids2datlist
### Keywords: mids

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Imputing nhanes data and convert result into a dataset list
##D #############################################################################
##D 
##D data(nhanes,package="mice")
##D 
##D #**** imputation using mice
##D imp1 <- mice::mice( nhanes, m=3, maxit=5 )
##D # convert mids object into list
##D datlist1 <- miceadds::mids2datlist( imp1 )
##D 
##D #**** imputation using mice.1chain
##D imp2 <- miceadds::mice.1chain( nhanes, burnin=4, iter=20, Nimp=5 )
##D # convert mids.1chain object into list
##D datlist2 <- miceadds::mids2datlist( imp2 )
##D 
##D #############################################################################
##D # EXAMPLE 2: Nested multiple imputation and datalist conversion
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss2, package="BIFIEsurvey" )
##D datlist <- data.timss2
##D    # list of 5 datasets containing 5 plausible values
##D 
##D # remove first four variables
##D M <- length(datlist)
##D for (ll in 1:M){
##D     datlist[[ll]] <- datlist[[ll]][, -c(1:4) ]
##D                 }
##D 
##D #***************
##D # (1) nested multiple imputation using mice
##D imp1 <- miceadds::mice.nmi( datlist,  m=4, maxit=3 )
##D summary(imp1)
##D 
##D #***************
##D # (2) nested multiple imputation using mice.1chain
##D imp2 <- miceadds::mice.nmi( datlist, Nimp=4, burnin=10,iter=22, type="mice.1chain")
##D summary(imp2)
##D 
##D #**************
##D # conversion into a datalist
##D datlist.i1 <- miceadds::mids2datlist( imp1 )
##D datlist.i2 <- miceadds::mids2datlist( imp2 )
##D 
##D #############################################################################
##D # EXAMPLE 3: mids object conversion and inclusion of further variables
##D #############################################################################
##D 
##D data(data.ma05)
##D dat <- data.ma05
##D 
##D # imputation
##D resp <- dat[, - c(1:2) ]
##D imp <- mice::mice( resp, imputationMethod="norm", maxit=2, m=3 )
##D 
##D # convert mids object into datalist
##D datlist0 <- miceadds::mids2datlist( imp )
##D # convert mids object into datalist and include some id variables
##D datlist1 <- miceadds::mids2datlist( imp, X=dat[,c(1,2) ] )
## End(Not run)



