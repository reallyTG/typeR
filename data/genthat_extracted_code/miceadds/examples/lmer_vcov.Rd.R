library(miceadds)


### Name: lmer_vcov
### Title: Statistical Inference for Fixed and Random Structure for Fitted
###   Models in 'lme4'
### Aliases: lmer_vcov summary.lmer_vcov coef.lmer_vcov vcov.lmer_vcov
###   lmer_vcov2 lmer_pool summary.lmer_pool lmer_pool2

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Single model fitted in lme4
##D #############################################################################
##D 
##D library(lme4)
##D data(data.ma01, package="miceadds")
##D dat <- na.omit(data.ma01)
##D 
##D #* fit multilevel model
##D formula <- math ~ hisei + miceadds::gm( books, idschool ) + ( 1 + books | idschool )
##D mod1 <- lme4::lmer( formula, data=dat, REML=FALSE)
##D summary(mod1)
##D 
##D #* statistical inference
##D res1 <- miceadds::lmer_vcov( mod1 )
##D summary(res1)
##D coef(res1)
##D vcov(res1)
##D 
##D #############################################################################
##D # EXAMPLE 2: lme4 model for multiply imputed dataset
##D #############################################################################
##D 
##D library(lme4)
##D data(data.ma02, package="miceadds")
##D datlist <- miceadds::datlist_create(data.ma02)
##D 
##D #** fit lme4 model for all imputed datasets
##D formula <- math ~ hisei + miceadds::gm( books, idschool ) + ( 1 | idschool )
##D models <- list()
##D M <- length(datlist)
##D for (mm in 1:M){
##D     models[[mm]] <- lme4::lmer( formula, data=datlist[[mm]], REML=FALSE)
##D }
##D 
##D #** statistical inference
##D res1 <- miceadds::lmer_pool(models)
##D summary(res1)
## End(Not run)



