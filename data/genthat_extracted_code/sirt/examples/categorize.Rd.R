library(sirt)


### Name: categorize
### Title: Categorize and Decategorize Variables in a Data Frame
### Aliases: categorize decategorize
### Keywords: Utilities

### ** Examples

## Not run: 
##D library(mice)
##D library(miceadds)
##D 
##D #############################################################################
##D # EXAMPLE 1: Categorize questionnaire data
##D #############################################################################
##D 
##D data(data.smallscale, package="miceadds")
##D dat <- data.smallscale
##D 
##D # (0) select dataset
##D dat <- dat[, 9:20 ]
##D summary(dat)
##D categorical <- colnames(dat)[2:6]
##D 
##D # (1) categorize data
##D res <- sirt::categorize( dat, categorical=categorical )
##D 
##D # (2) multiple imputation using the mice package
##D dat2 <- res$data
##D VV <- ncol(dat2)
##D impMethod <- rep( "sample", VV )    # define random sampling imputation method
##D names(impMethod) <- colnames(dat2)
##D imp <- mice::mice( as.matrix(dat2), impMethod=impMethod, maxit=1, m=1 )
##D dat3 <- mice::complete(imp,action=1)
##D 
##D # (3) decategorize dataset
##D dat3a <- sirt::decategorize( dat3, categ_design=res$categ_design )
##D 
##D #############################################################################
##D # EXAMPLE 2: Categorize ordinal and continuous data
##D #############################################################################
##D 
##D data(data.ma01,package="miceadds")
##D dat <- data.ma01
##D summary(dat[,-c(1:2)] )
##D 
##D # define variables to be categorized
##D categorical <- c("books", "paredu" )
##D # define quantiles
##D quant <-  c(6,5,11)
##D names(quant) <- c("math", "read", "hisei")
##D 
##D # categorize data
##D res <- sirt::categorize( dat, categorical=categorical, quant=quant)
##D str(res)
## End(Not run)



