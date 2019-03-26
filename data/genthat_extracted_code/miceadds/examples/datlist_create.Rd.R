library(miceadds)


### Name: datlist_create
### Title: Creates Objects of Class 'datlist' or 'nested.datlist'
### Aliases: datlist_create nested.datlist_create print.datlist
###   print.nested.datlist nested.datlist2datlist datlist2nested.datlist
### Keywords: print

### ** Examples

## Not run: 
##D ## The function datlist_create is currently defined as
##D function (datasets)
##D {
##D     class(datasets) <- "datlist"
##D     return(datasets)
##D   }
##D 
##D #############################################################################
##D # EXAMPLE 1: Create object of class datlist
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss2, package="BIFIEsurvey" )
##D datlist <- data.timss2
##D 
##D # class datlist
##D obj1 <- miceadds::datlist_create(data.timss2)
##D 
##D #############################################################################
##D # EXAMPLE 2: Multiply imputed datasets: Different object classes
##D #############################################################################
##D 
##D library(mice)
##D data(nhanes2, package="mice")
##D set.seed(990)
##D 
##D # nhanes2 data imputation
##D imp1 <- miceadds::mice.1chain( nhanes2, burnin=5, iter=25, Nimp=5 )
##D # object of class datlist
##D imp2 <- miceadds::mids2datlist(imp1)
##D # alternatively, one can use datlist_create
##D imp2b <- miceadds::datlist_create(imp1)
##D # object of class imputationList
##D imp3 <- mitools::imputationList(imp2)
##D # retransform object in class datlist
##D imp2c <- miceadds::datlist_create(imp3)
##D str(imp2c)
##D 
##D #############################################################################
##D # EXAMPLE 3: Nested multiply imputed datasets
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss2, package="BIFIEsurvey" )
##D datlist <- data.timss2
##D    # list of 5 datasets containing 5 plausible values
##D 
##D #** define imputation method and predictor matrix
##D data <- datlist[[1]]
##D V <- ncol(data)
##D # variables
##D vars <- colnames(data)
##D # variables not used for imputation
##D vars_unused <- miceadds::scan.vec("IDSTUD TOTWGT  JKZONE  JKREP" )
##D 
##D #- define imputation method
##D impMethod <- rep("norm", V )
##D names(impMethod) <- vars
##D impMethod[ vars_unused ] <- ""
##D 
##D #- define predictor matrix
##D predM <- matrix( 1, V, V )
##D colnames(predM) <- rownames(predM) <- vars
##D diag(predM) <- 0
##D predM[, vars_unused ] <- 0
##D 
##D # object of class nmi
##D imp1 <- miceadds::mice.nmi( datlist, method=impMethod, predictorMatrix=predM,
##D                 m=4, maxit=3 )
##D # object of class nested.datlist
##D imp2 <- miceadds::mids2datlist(imp1)
##D # object of class NestedImputationList
##D imp3 <- miceadds::NestedImputationList(imp2)
##D # redefine class nested.datlist
##D imp4 <- miceadds::nested.datlist_create(imp3)
##D 
##D #############################################################################
##D # EXAMPLE 4: Conversions between nested lists of datasets and lists of datasets
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss4, package="BIFIEsurvey" )
##D datlist <- data.timss4
##D 
##D # object of class nested.datlist
##D datlist1a <- miceadds::nested.datlist_create(datlist)
##D # object of class NestedImputationList
##D datlist1b <- miceadds::NestedImputationList(datlist)
##D 
##D # conversion to datlist
##D datlist2a <- miceadds::nested.datlist2datlist(datlist1a)  # class datlist
##D datlist2b <- miceadds::nested.datlist2datlist(datlist1b)  # class imputationList
##D 
##D # convert into a nested list with 2 between nests and 10 within nests
##D datlist3a <- miceadds::datlist2nested.datlist(datlist2a, Nimp=c(2,10) )
##D datlist3b <- miceadds::datlist2nested.datlist(datlist2b, Nimp=c(4,5) )
## End(Not run)



