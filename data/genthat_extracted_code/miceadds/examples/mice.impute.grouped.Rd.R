library(miceadds)


### Name: mice.impute.grouped
### Title: Imputation of a Variable with Grouped Values
### Aliases: mice.impute.grouped
### Keywords: mice imputation method

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Imputation of grouped data
##D #############################################################################
##D 
##D data(data.ma06)
##D data <- data.ma06
##D 
##D # define the variable "FC_imp" which should contain the variables to be imputed
##D data$FC_imp <- NA
##D V <- ncol(data)
##D # variables not to be used for imputation
##D vars_elim <-  c("id", "FC","FC_low","FC_upp")
##D 
##D # define imputation methods
##D impM <- rep("norm", V)
##D names(impM) <- colnames(data)
##D impM[  vars_elim ] <- ""
##D impM[ "FC_imp" ] <- "grouped"
##D 
##D # define predictor matrix
##D predM <- 1 - diag( 0, V)
##D rownames(predM) <- colnames(predM) <- colnames(data)
##D predM[vars_elim, ] <- 0
##D predM[,vars_elim] <- 0
##D 
##D # define lower and upper boundaries of the grouping intervals
##D low <- list("FC_imp"=data$FC_low )
##D upp <- list("FC_imp"=data$FC_upp )
##D 
##D # perform imputation
##D imp <- mice::mice( data, method=impM, predictorMatrix=predM,
##D         m=1, maxit=3, allow.na=TRUE,  low=low, upp=upp)
##D head( mice::complete(imp))
## End(Not run)



