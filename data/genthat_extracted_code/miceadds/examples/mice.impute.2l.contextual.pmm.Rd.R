library(miceadds)


### Name: mice.impute.2l.contextual.pmm
### Title: Imputation by Predictive Mean Matching or Normal Linear
###   Regression with Contextual Variables
### Aliases: mice.impute.2l.contextual.pmm mice.impute.2l.contextual.norm
### Keywords: mice imputation method

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Sequential hierarchical imputation for data.ma05 dataset
##D #############################################################################
##D 
##D data(data.ma05)
##D dat <- data.ma05
##D 
##D # define predictor matrix
##D predM <- mice::make.predictorMatrix(data=dat)
##D # exclude student IDs
##D predM[, "idstud"] <- 0
##D # define idclass as the cluster variable (type=-2)
##D predM[, "idclass" ] <- -2
##D 
##D # initialize with norm method
##D impMethod <- mice::make.method(data=dat)
##D names(impMethod) <- names( imp0$method )
##D impMethod[ c("idstud","idclass")] <- ""
##D 
##D #*****
##D # STUDENT LEVEL (Level 1)
##D 
##D # Use a random slope model for Dscore and Mscore as the imputation method.
##D # Here, variance homogeneity of residuals is assumed (contrary to
##D # the 2l.norm imputation method in the mice package).
##D impMethod[ c("Dscore", "Mscore") ] <- "2l.pan"
##D predM[ c("Dscore","Mscore"), "misei" ] <- 2    # random slopes on 'misei'
##D predM[, "idclass" ] <- -2
##D 
##D # For imputing 'manote' and 'denote' use contextual effects (i.e. cluszer means)
##D # of variables 'misei' and 'migrant'
##D impMethod[ c("denote", "manote") ] <- "2l.contextual.pmm"
##D predM[ c("denote", "manote"), c("misei","migrant")] <- 2
##D 
##D # Use no cluster variable 'idclass' for imputation of 'misei'
##D impMethod[ "misei"] <- "norm"
##D predM[ "misei", "idclass"] <- 0 # use no multilevel imputation model
##D 
##D # Variable migrant: contextual effects of Dscore and misei
##D impMethod[ "migrant"] <- "2l.contextual.pmm"
##D predM[ "migrant", c("Dscore",  "misei" ) ] <- 2
##D predM[ "migrant", "idclass" ] <- -2
##D 
##D #****
##D # CLASS LEVEL (Level 2)
##D # impute 'sprengel' and 'groesse' at the level of classes
##D impMethod[ "sprengel"] <- "2lonly.pmm"
##D impMethod[ "groesse"] <- "2lonly.norm"
##D predM[ c("sprengel","groesse"), "idclass" ] <- -2
##D 
##D # do imputation
##D imp <- mice::mice( dat, predictorMatrix=predM, m=3,  maxit=4,
##D            imputationMethod=impMethod, paniter=100)
##D summary(imp)
##D 
##D #**** imputation model 2 with PLS dimension reduction
##D 
##D # define some interaction effects
##D interactions <- list( manote=c("migrant", "misei") )
##D # number of PLS factors (5 factors)
##D pls.facs <- list( manote=5 )
##D 
##D # do imputation
##D imp2 <- mice::mice( dat, predictorMatrix=predM, interactions=interactions,
##D             pls.facs=pls.facs, method=impMethod, paniter=100)
##D summary(imp2)
## End(Not run)



