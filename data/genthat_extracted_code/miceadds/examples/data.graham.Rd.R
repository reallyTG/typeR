library(miceadds)


### Name: data.graham
### Title: Datasets from Grahams _Missing Data_ Book
### Aliases: data.graham data.graham.ex3 data.graham.ex6 data.graham.ex8a
###   data.graham.ex8b data.graham.ex8c
### Keywords: datasets

### ** Examples

## Not run: 
##D library(mitools)
##D library(mice)
##D library(Amelia)
##D library(jomo)
##D 
##D #############################################################################
##D # EXAMPLE 1: data.graham.8a | Imputation under multivariate normal model
##D #############################################################################
##D 
##D data(data.graham.ex8a)
##D dat <- data.graham.ex8a
##D dat <- dat[,1:10]
##D vars <- colnames(dat)
##D V <- length(vars)
##D # remove persons with completely missing data
##D dat <- dat[ rowMeans( is.na(dat) ) < 1, ]
##D summary(dat)
##D 
##D # some descriptive statistics
##D psych::describe(dat)
##D 
##D #**************
##D # imputation under a multivariate normal model
##D M <- 7  # number of imputations
##D 
##D #--------- mice package
##D # define imputation method
##D impM <- rep("norm", V)
##D names(impM) <- vars
##D # mice imputation
##D imp1a <- mice::mice( dat, method=impM, m=M, maxit=4 )
##D summary(imp1a)
##D # convert into a list of datasets
##D datlist1a <- miceadds::mids2datlist(imp1a)
##D 
##D #--------- Amelia package
##D imp1b <- Amelia::amelia( dat, m=M )
##D summary(imp1b)
##D datlist1b <- imp1b$imputations
##D 
##D #--------- jomo package
##D imp1c <- jomo::jomo1con(Y=dat, nburn=100, nbetween=10, nimp=M)
##D str(imp1c)
##D # convert into a list of datasets
##D datlist1c <- miceadds::jomo2datlist(imp1c)
##D 
##D # alternatively one can use the jomo wrapper function
##D imp1c1 <- jomo::jomo(Y=dat, nburn=100, nbetween=10, nimp=M)
##D 
##D #############################################################################
##D # EXAMPLE 2: data.graham.8b | Imputation with categorical variables
##D #############################################################################
##D 
##D data(data.graham.ex8b)
##D dat <- data.graham.ex8b
##D vars <- colnames(dat)
##D V <- length(vars)
##D 
##D # descriptive statistics
##D psych::describe(dat)
##D 
##D #*******************************
##D # imputation in mice using predictive mean matching
##D imp1a <- mice::mice( dat, m=5, maxit=10)
##D datlist1a <- mitools::imputationList( miceadds::mids2datlist(imp1a) )
##D print(datlist1a)
##D 
##D #*******************************
##D # imputation in jomo treating all variables as categorical
##D 
##D # Note that variables must have values from 1 to N
##D # use categorize function from sirt package here
##D dat.categ <- sirt::categorize( dat, categorical=colnames(dat), lowest=1 )
##D dat0 <- dat.categ$data
##D 
##D # imputation in jomo treating all variables as categorical
##D Y_numcat <- apply( dat0, 2, max, na.rm=TRUE )
##D imp1b <- jomo::jomo1cat(Y.cat=dat0, Y.numcat=Y_numcat, nburn=100,
##D                  nbetween=10, nimp=5)
##D 
##D # recode original categories
##D datlist1b <- sirt::decategorize( imp1b, categ_design=dat.categ$categ_design )
##D # convert into a list of datasets
##D datlist1b <- miceadds::jomo2datlist(datlist1b)
##D datlist1b <- mitools::imputationList( datlist1b )
##D 
##D # Alternatively, jomo can be used but categorical variables must be
##D # declared as factors
##D dat <- dat0
##D # define two variables as factors
##D vars <- miceadds::scan.vec(" rskreb71 rskreb72")
##D for (vv in vars){
##D     dat[, vv] <- as.factor( dat[,vv] )
##D           }
##D # use jomo
##D imp1b1 <- jomo::jomo(Y=dat, nburn=30, nbetween=10, nimp=5)
##D 
##D #****************************
##D # compare frequency tables for both imputation packages
##D fun_prop <- function( variable ){
##D             t1 <- table(variable)
##D             t1 / sum(t1)
##D                 }
##D 
##D # variable rskreb71
##D res1a <-  with( datlist1a, fun_prop(rskreb71) )
##D res1b <-  with( datlist1b, fun_prop(rskreb71) )
##D summary( miceadds::NMIcombine(qhat=res1a, NMI=FALSE ) )
##D summary( miceadds::NMIcombine(qhat=res1b, NMI=FALSE ) )
##D 
##D # variable posatt
##D res2a <-  with( datlist1a, fun_prop(posatt) )
##D res2b <-  with( datlist1b, fun_prop(posatt) )
##D summary( miceadds::NMIcombine(qhat=res2a, NMI=FALSE ) )
##D summary( miceadds::NMIcombine(qhat=res2b, NMI=FALSE ) )
## End(Not run)



