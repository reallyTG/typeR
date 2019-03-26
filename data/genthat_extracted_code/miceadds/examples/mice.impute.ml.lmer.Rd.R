library(miceadds)


### Name: mice.impute.ml.lmer
### Title: Multilevel Imputation Using 'lme4'
### Aliases: mice.impute.ml.lmer

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Imputation of three-level data with normally distributed residuals
##D #############################################################################
##D 
##D data(data.ma07, package="miceadds")
##D dat <- data.ma07
##D 
##D # variables at level 1 (identifier id1): x1 (some missings), x2 (complete)
##D # variables at level 2 (identifier id2): y1 (some missings), y2 (complete)
##D # variables at level 3 (identifier id3): z1 (some missings), z2 (complete)
##D 
##D #****************************************************************************
##D # Imputation model 1
##D 
##D #----- specify levels of variables (only relevent for variables
##D #      with missing values)
##D variables_levels <- miceadds:::mice_impute_create_type_vector( colnames(dat), value="")
##D  # leave variables at lowest level blank (i.e., "")
##D variables_levels[ c("y1","y2") ] <- "id2"
##D variables_levels[ c("z1","z2") ] <- "id3"
##D 
##D #----- specify predictor matrix
##D predmat <- mice::make.predictorMatrix(data=dat)
##D predmat[, c("id2", "id3") ] <- 0
##D # set -2 for cluster identifier for level 3 variable z1
##D # because "2lonly" function is used
##D predmat[ "z1", "id3" ] <- -2
##D 
##D #----- specify imputation methods
##D method <- mice::make.method(data=dat)
##D method[c("x1","y1")] <- "ml.lmer"
##D method[c("z1")] <- "2lonly.norm"
##D 
##D #----- specify hierarchical structure of imputation models
##D levels_id <- list()
##D #** hierarchical structure for variable x1
##D levels_id[["x1"]] <- c("id2", "id3")
##D #** hierarchical structure for variable y1
##D levels_id[["y1"]] <- c("id3")
##D 
##D #----- specify random slopes
##D random_slopes <- list()
##D #** random slopes for variable x1
##D random_slopes[["x1"]] <- list( "id2"=c("x2"), "id3"=c("y1") )
##D # if no random slopes should be specified, the corresponding entry can be left empty
##D # and only a random intercept is used in the imputation model
##D 
##D #----- imputation in mice
##D imp1 <- mice::mice( dat, maxit=10, m=5, method=method,
##D             predictorMatrix=predmat, levels_id=levels_id,  random_slopes=random_slopes,
##D             variables_levels=variables_levels )
##D summary(imp1)
##D 
##D #****************************************************************************
##D # Imputation model 2
##D 
##D #----- impute x1 with predictive mean matching and y1 with normally distributed residuals
##D model <- list( x1="pmm", y1="continuous" )
##D 
##D #----- assume only random intercepts
##D random_slopes <- NULL
##D 
##D #---- create interactions with z2 for all predictors in imputation models for x1 and y1
##D interactions <- list( "x1"=z2, "y1"=z2)
##D 
##D #----- imputation in mice
##D imp2 <- mice::mice( dat, method=method, predictorMatrix=predmat,
##D                 levels_id=levels_id, random_slopes=random_slopes,
##D                 variables_levels=variables_levels, model=model, interactions=interactions)
##D summary(imp2)
## End(Not run)



