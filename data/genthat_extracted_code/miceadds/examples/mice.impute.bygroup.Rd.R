library(miceadds)


### Name: mice.impute.bygroup
### Title: Groupwise Imputation Function
### Aliases: mice.impute.bygroup

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Cluster-specific imputation for some variables
##D #############################################################################
##D 
##D library(mice)
##D data( data.ma01, package="miceadds")
##D dat <- data.ma01
##D 
##D # use sub-dataset
##D dat <- dat[ dat$idschool <=1006, ]
##D V <- ncol(dat)
##D # create initial predictor matrix and imputation methods
##D predictorMatrix <- matrix( 1, nrow=V, ncol=V)
##D diag(predictorMatrix) <- 0
##D rownames(predictorMatrix) <- colnames(predictorMatrix) <- colnames(dat)
##D predictorMatrix[, c("idstud", "studwgt","urban" ) ] <- 0
##D method <- rep("norm", V)
##D names(method) <- colnames(dat)
##D 
##D #** groupwise imputation of variable books
##D method["books"] <- "bygroup"
##D # specify name of the grouping variable ('idschool') and imputation method ('norm')
##D group <- list( "books"="idschool" )
##D imputationFunction <- list("books"="norm" )
##D 
##D #** conduct multiple imputation in mice
##D imp <- mice::mice( dat, method=method, predictorMatrix=predictorMatrix,
##D             m=1, maxit=1, group=group, imputationFunction=imputationFunction )
##D 
##D #############################################################################
##D # EXAMPLE 2: Group-wise multilevel imputation '2l.pan'
##D #############################################################################
##D 
##D library(mice)
##D data( data.ma01, package="miceadds" )
##D dat <- data.ma01
##D 
##D # select data
##D dat <- dat[, c("idschool","hisei","books","female") ]
##D V <- ncol(dat)
##D dat <- dat[ ! is.na( dat$books), ]
##D # define factor variable
##D 
##D dat$books <- as.factor(dat$books)
##D # create initial predictor matrix and imputation methods
##D predictorMatrix <- matrix( 0, nrow=V, ncol=V)
##D rownames(predictorMatrix) <- colnames(predictorMatrix) <- colnames(dat)
##D predictorMatrix["idschool", ] <- 0
##D predictorMatrix[ "hisei", "idschool" ] <- -2
##D predictorMatrix[ "hisei", c("books","female") ] <- 1
##D method <- rep("", V)
##D names(method) <- colnames(dat)
##D method["hisei"] <- "bygroup"
##D group <- list( "hisei"="female" )
##D imputationFunction <- list("hisei"="2l.pan" )
##D 
##D #** conduct multiple imputation in mice
##D imp <- mice::mice( dat, method=method, predictorMatrix=predictorMatrix,
##D             m=1, maxit=1, group=group, imputationFunction=imputationFunction )
##D str(imp)
## End(Not run)



