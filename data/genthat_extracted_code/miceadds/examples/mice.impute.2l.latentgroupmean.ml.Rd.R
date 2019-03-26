library(miceadds)


### Name: mice.impute.2l.latentgroupmean.ml
### Title: Imputation of Latent and Manifest Group Means for Multilevel
###   Data
### Aliases: mice.impute.2l.latentgroupmean.ml
###   mice.impute.2l.latentgroupmean.mcmc mice.impute.2l.groupmean
###   mice.impute.2l.groupmean.elim
### Keywords: mice imputation method

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Two-level imputation data.ma05 dataset with imputation
##D #            of a latent group mean
##D #############################################################################
##D 
##D data(data.ma05)
##D dat <- data.ma05
##D 
##D # include manifest group mean for 'Mscore'
##D dat$M.Mscore <- NA
##D # include latent group group for 'Mscore'
##D dat$LM.Mscore <- NA    #=> LM: latent group mean
##D 
##D # define predictor matrix
##D predM <- mice::make.predictorMatrix(data=dat)
##D # exclude student ISs
##D predM[, "idstud"] <- 0
##D # idclass is the cluster identifier
##D predM[, "idclass" ] <- -2
##D 
##D # define imputation methods
##D impMethod <- mice::make.method(data=dat)
##D # initialize with norm
##D impMethod <- rep( "norm", length(impMethod) )
##D names(impMethod) <- names( imp$method )
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
##D # For imputing 'manote' and 'denote' use contextual effects (i.e. cluster means)
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
##D impMethod[ "sprengel"] <- "2lonly.pmm2"
##D impMethod[ "groesse"] <- "2lonly.norm2"
##D predM[ c("sprengel","groesse"), "idclass" ] <- -2
##D 
##D # manifest group mean for Mscore
##D impMethod[ "M.Mscore" ] <- "2l.groupmean"
##D # latent group mean for Mscore
##D impMethod[ "LM.Mscore" ] <- "2l.latentgroupmean.ml"
##D predM[ "M.Mscore", "Mscore" ] <- 2
##D 
##D # covariates for latent group mean of 'Mscore'
##D predM[ "LM.Mscore", "Mscore" ] <- 2
##D predM[ "LM.Mscore", c( "Dscore", "sprengel" ) ] <- 1
##D 
##D # do imputations
##D imp <- mice::mice( dat, predictorMatrix=predM, m=3,  maxit=4,
##D          method=impMethod, allow.na=TRUE, pan.iter=100)
## End(Not run)



