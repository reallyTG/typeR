library(miceadds)


### Name: ma.wtd.statNA
### Title: Some Multivariate Descriptive Statistics for Weighted Data in
###   'miceadds'
### Aliases: ma.wtd.statNA ma.wtd.covNA ma.wtd.corNA ma.wtd.meanNA
###   ma.wtd.sdNA ma.wtd.skewnessNA ma.wtd.kurtosisNA ma.wtd.quantileNA
### Keywords: Descriptives

### ** Examples

#############################################################################
# EXAMPLE 1: Weighted statistics for a single dataset data.ma01
#############################################################################

data(data.ma01)
dat <- as.matrix(data.ma01[,-c(1:3)])

# weighted mean
ma.wtd.meanNA( dat, weights=data.ma01$studwgt  )

# weighted SD
ma.wtd.sdNA( dat, weights=data.ma01$studwgt  )

# weighted covariance for selected variables
ma.wtd.covNA( dat, weights=data.ma01$studwgt, vars=c("books","hisei") )

# weighted correlation
ma.wtd.corNA( dat, weights=data.ma01$studwgt )

# weighted skewness
ma.wtd.skewnessNA( dat[,"books"], weights=data.ma01$studwgt )
# compare with result in TAM
TAM::weighted_skewness( x=dat[,"books"], w=data.ma01$studwgt )

# weighted kurtosis
ma.wtd.kurtosisNA( dat, weights=data.ma01$studwgt, vars=c("books","hisei") )
## Not run: 
##D # compare with TAM
##D TAM::weighted_kurtosis( dat[,"books"], w=data.ma01$studwgt )
##D TAM::weighted_kurtosis( dat[,"hisei"], w=data.ma01$studwgt )
##D 
##D #############################################################################
##D # EXAMPLE 2: Weighted statistics multiply imputed dataset
##D #############################################################################
##D 
##D library(mitools)
##D data(data.ma05)
##D dat <- data.ma05
##D 
##D # do imputations
##D resp <- dat[, - c(1:2) ]
##D # object of class mids
##D imp <- mice::mice( resp, method="norm", maxit=3, m=5 )
##D # object of class datlist
##D datlist <- miceadds::mids2datlist( imp )
##D # object of class imputationList
##D implist <- mitools::imputationList(datlist)
##D 
##D # weighted means
##D ma.wtd.meanNA(datlist)
##D ma.wtd.meanNA(implist)
##D ma.wtd.meanNA(imp)
##D 
##D # weighted quantiles
##D ma.wtd.quantileNA( implist, weights=data.ma05$studwgt, vars=c("manote","Dscore"))
##D 
##D #############################################################################
##D # EXAMPLE 3: Weighted statistics nested multiply imputed dataset
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss2, package="BIFIEsurvey" )
##D datlist <- data.timss2   # list of 5 datasets containing 5 plausible values
##D 
##D #** define imputation method and predictor matrix
##D data <- datlist[[1]]
##D V <- ncol(data)
##D # variables
##D vars <- colnames(data)
##D # variables not used for imputation
##D vars_unused <- miceadds::scan.vec("IDSTUD TOTWGT  JKZONE  JKREP" )
##D #- define imputation method
##D impMethod <- rep("norm", V )
##D names(impMethod) <- vars
##D impMethod[ vars_unused ] <- ""
##D #- define predictor matrix
##D predM <- matrix( 1, V, V )
##D colnames(predM) <- rownames(predM) <- vars
##D diag(predM) <- 0
##D predM[, vars_unused ] <- 0
##D 
##D # object of class mids.nmi
##D imp1 <- miceadds::mice.nmi( datlist, method=impMethod, predictorMatrix=predM,
##D                 m=4, maxit=3 )
##D # object of class nested.datlist
##D datlist <- miceadds::mids2datlist(imp1)
##D # object of class NestedImputationList
##D imp2 <- miceadds::NestedImputationList(datlist)
##D 
##D # weighted correlations
##D vars <- c("books","ASMMAT","likesc")
##D ma.wtd.corNA( datlist,  vars=vars )
##D ma.wtd.corNA( imp2,  vars=vars )
##D ma.wtd.corNA( imp1,  vars=vars )
##D 
##D #############################################################################
##D # EXAMPLE 4: Multiply imputed datasets in BIFIEdata format
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss1, package="BIFIEsurvey")
##D data(data.timssrep, package="BIFIEsurvey")
##D 
##D # create BIFIEdata object
##D bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
##D             wgtrep=data.timssrep[, -1 ] )
##D summary(bdat)
##D # create BIFIEdata object in a compact way
##D bdat2 <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
##D             wgtrep=data.timssrep[, -1 ], cdata=TRUE)
##D summary(bdat2)
##D 
##D # compute skewness
##D ma.wtd.skewnessNA( bdat, vars=c("ASMMAT", "books" ) )
##D ma.wtd.skewnessNA( bdat2, vars=c("ASMMAT", "books" ) )
##D 
##D #############################################################################
##D # EXAMPLE 5: Nested multiply imputed datasets in BIFIEdata format
##D #############################################################################
##D 
##D data(data.timss4, package="BIFIEsurvey")
##D data(data.timssrep, package="BIFIEsurvey")
##D 
##D # nested imputed dataset, save it in compact format
##D bdat <- BIFIE.data( data.list=data.timss4, wgt=data.timss4[[1]][[1]]$TOTWGT,
##D             wgtrep=data.timssrep[, -1 ], NMI=TRUE, cdata=TRUE )
##D summary(bdat)
##D # skewness
##D ma.wtd.skewnessNA( bdat, vars=c("ASMMAT", "books" ) )
## End(Not run)



