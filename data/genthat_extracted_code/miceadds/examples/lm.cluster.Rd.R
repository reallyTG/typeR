library(miceadds)


### Name: lm.cluster
### Title: Cluster Robust Standard Errors for Linear Models and General
###   Linear Models
### Aliases: lm.cluster glm.cluster coef.lm.cluster coef.glm.cluster
###   vcov.lm.cluster vcov.glm.cluster summary.lm.cluster
###   summary.glm.cluster
### Keywords: Cluster robust standard errors coef vcov

### ** Examples

#############################################################################
# EXAMPLE 1: Cluster robust standard errors data.ma01
#############################################################################

data(data.ma01)
dat <- data.ma01

#*** Model 1: Linear regression
mod1 <- miceadds::lm.cluster( data=dat, formula=read ~ hisei + female,
               cluster="idschool" )
coef(mod1)
vcov(mod1)
summary(mod1)

# estimate Model 1, but cluster is provided as a vector
mod1b <- miceadds::lm.cluster( data=dat, formula=read ~ hisei + female,
                 cluster=dat$idschool)
summary(mod1b)

#*** Model 2: Logistic regression
dat$highmath <- 1 * ( dat$math > 600 )   # create dummy variable
mod2 <- miceadds::glm.cluster( data=dat, formula=highmath ~ hisei + female,
                cluster="idschool", family="binomial")
coef(mod2)
vcov(mod2)
summary(mod2)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Cluster robust standard errors for multiply imputed datasets
##D #############################################################################
##D 
##D library(mitools)
##D data(data.ma05)
##D dat <- data.ma05
##D 
##D # imputation of the dataset: use six imputations
##D resp <- dat[, - c(1:2) ]
##D imp <- mice::mice( resp, method="norm", maxit=3, m=6 )
##D datlist <- miceadds::mids2datlist( imp )
##D 
##D # linear regression with cluster robust standard errors
##D mod <- lapply(  datlist, FUN=function(data){
##D             miceadds::lm.cluster( data=data, formula=denote ~ migrant+ misei,
##D                     cluster=dat$idclass )
##D             }  )
##D # extract parameters and covariance matrix
##D betas <- lapply( mod, FUN=function(rr){ coef(rr) } )
##D vars <- lapply( mod, FUN=function(rr){ vcov(rr) } )
##D # conduct statistical inference
##D summary( miceadds::pool_mi( qhat=betas, u=vars ) )
##D 
##D #------ compute global F-test for hypothesis that all predictors have zero coefficient values
##D library(mitml)
##D Nimp <- 6 # number of imputations
##D np <- length(betas[[1]])   # number of parameters
##D beta_names <- names(betas[[1]])
##D # define vector of parameters for which constraints should be tested
##D constraints <- beta_names[-1]
##D # create input for mitml::testConstraints function
##D qhat <- matrix( unlist(betas), ncol=Nimp)
##D rownames(qhat) <- beta_names
##D uhat <- array( unlist(vars), dim=c(np,np,Nimp))
##D dimnames(uhat) <- list( beta_names, beta_names, NULL )
##D # compute global F-test
##D Ftest <- mitml::testConstraints( qhat=betas, uhat=vars, constraints=constraints )
##D print(Ftest)
## End(Not run)



