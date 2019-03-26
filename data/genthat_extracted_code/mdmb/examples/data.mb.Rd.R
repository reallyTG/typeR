library(mdmb)


### Name: data.mb
### Title: Example Datasets for 'mdmb' Package
### Aliases: data.mb data.mb01 data.mb02 data.mb03 data.mb04 data.mb05

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Linear interaction example from Enders et al. (2014)
##D #############################################################################
##D 
##D # load packages
##D library(mdmb)
##D library(mice)
##D library(mitools)
##D library(sandwich)
##D 
##D #--- attach example dataset (Enders et al., 2014) from mdmb package
##D data( data.mb03, package="mdmb")
##D dat <- data.mb03
##D 
##D #--- center data which speeds convergence of Bayesian estimation
##D #--- of the imputation model
##D for (vv in 1:3){
##D     M_vv <- mean( dat[,vv], na.rm=TRUE )
##D     dat[,vv] <- dat[,vv] - M_vv
##D }
##D 
##D #--- generate initial imputed values withj mice package
##D imp <- mice::mice( dat, m=, maxit=20 )
##D data_init <- mice::complete(imp, action=1)
##D 
##D #--- define number of iterations and number of imputed datasets
##D iter <- 50000; burnin <- 5000
##D Nimp <- 100
##D 
##D #******* imputation model M3 with quadratic effects
##D 
##D # model for dependent variable
##D dep <- list("model"="linreg", "formula"=y ~ x*z + I(x^2) + I(z^2) )
##D # covariate models
##D ind_x <- list( "model"="linreg", "formula"=x ~ z + I(z^2) )
##D ind_z <- list( "model"="linreg", "formula"=z ~ 1 )
##D ind <- list( x=ind_x, z=ind_z)
##D 
##D #generate imputations
##D imp <- mdmb::frm_fb(dat=dat, dep=dep, ind=ind, burnin=burnin, iter=iter,
##D               data_init=data_init, Nimp=Nimp)
##D 
##D #--- create list of multiply imputed datasets
##D datlist <- mdmb::frm2datlist(imp)
##D 
##D #-------------------------------
##D #--- analyze imputed datasets with mice package
##D 
##D # convert into object of class mids
##D imp2 <- miceadds::datlist2mids(datlist)
##D # estimate linear model on multiply imputed datasets
##D mod1 <- with(imp2, stats::lm( y ~ x*z ) )
##D summary( mice::pool(mod1) )
##D 
##D #-------------------------------
##D #--- analyze imputed datasets using sandwich standard errors
##D 
##D results <- list()
##D variances <- list()
##D Nimp <- length(datlist)
##D for (ii in 1:Nimp){
##D     mod_ii <- stats::lm( y ~ x*z, data=datlist[[ii]] )
##D     variances[[ii]] <- sandwich::vcovHC(mod_ii)
##D     results[[ii]] <- coef(mod_ii)
##D }
##D 
##D mod2 <- mitools::MIcombine(results=results,variances=variances,df.complete=69)
##D summary(mod2)
## End(Not run)



