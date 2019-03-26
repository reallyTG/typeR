library(miceadds)


### Name: with.miceadds
### Title: Evaluates an Expression for (Nested) Multiply Imputed Datasets
### Aliases: with.mids.1chain with.mids.nmi with.NestedImputationList
###   with.datlist with.nested.datlist within.imputationList
###   within.NestedImputationList within.datlist within.nested.datlist
###   summary.mira.nmi withPool_MI withPool_NMI
### Keywords: with summary within

### ** Examples

#############################################################################
# EXAMPLE 1: One chain nhanes data | application of 'with' and 'within'
#############################################################################

library(mice)
data(nhanes, package="mice")
set.seed(9090)

# nhanes data in one chain
imp <- miceadds::mice.1chain( nhanes, burnin=5, iter=40, Nimp=4 )
# apply linear regression
res <- with( imp, expr=stats::lm( hyp ~ age + bmi  ) )
summary(res)
# pool results
summary( mice::pool(res))

# calculate some descriptive statistics
res2 <- with( imp, expr=c("M1"=mean(hyp), "SD_age"=stats::sd(age) ) )
# pool estimates
withPool_MI(res2)

# with method for datlist
imp1 <- miceadds::datlist_create(imp)
res2b <- with( imp1, fun=function(data){
                    dfr <- data.frame("M"=colMeans(data),
                             "Q5"=apply( data, 2, stats::quantile, .05 ),
                             "Q95"=apply( data, 2, stats::quantile, .95 ) )
                    return(dfr)
                        } )
withPool_MI(res2b)

# convert mids object into an object of class imputationList
datlist <- miceadds::mids2datlist( imp )
datlist <- mitools::imputationList(datlist)

## Not run: 
##D # define formulas for modification of the data frames in imputationList object
##D datlist2 <- within( datlist, {
##D                      age.D3 <- 1*(age==3)
##D                      hyp_chl <- hyp * chl
##D                         } )
##D # look at modified dataset
##D head( datlist2$imputations[[1]] )
##D 
##D # convert into a datlist
##D datlist2b <- miceadds::datlist_create( datlist2 )
##D 
##D # apply linear model using expression
##D mod1a <- with( datlist2, expr=stats::lm( hyp ~ age.D3 ) )
##D # do the same but now with a function argument
##D mod1b <- with( datlist2, fun=function(data){
##D                     stats::lm( data$hyp ~ data$age.D3 )
##D                         } )
##D # apply the same model for object datlist2b
##D mod2a <- with( datlist2b, expr=lm( hyp ~ age.D3 ) )
##D mod2b <- with( datlist2b, fun=function(data){
##D                     stats::lm( data$hyp ~ data$age.D3 )
##D                         } )
##D 
##D mitools::MIcombine(mod1a)
##D mitools::MIcombine(mod1b)
##D mitools::MIcombine(mod2a)
##D mitools::MIcombine(mod2b)
##D 
##D #############################################################################
##D # EXAMPLE 2: Nested multiple imputation and application of with/within methods
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss2, package="BIFIEsurvey" )
##D datlist <- data.timss2
##D 
##D # remove first four variables
##D M <- length(datlist)
##D for (ll in 1:M){
##D     datlist[[ll]] <- datlist[[ll]][, -c(1:4) ]
##D                 }
##D 
##D # nested multiple imputation using mice
##D imp1 <- miceadds::mice.nmi( datlist,  m=4, maxit=3 )
##D summary(imp1)
##D # apply linear model and use summary method for all analyses of imputed datasets
##D res1 <- with( imp1, stats::lm( ASMMAT ~ migrant + female ) )
##D summary(res1)
##D 
##D # convert mids.nmi object into an object of class NestedImputationList
##D datlist1 <- miceadds::mids2datlist( imp1 )
##D datlist1 <- miceadds::NestedImputationList( datlist1 )
##D # convert into nested.datlist object
##D datlist1b <- miceadds::nested.datlist_create(datlist1)
##D 
##D # use with function
##D res1b <- with( datlist1, stats::glm( ASMMAT ~ migrant + female ) )
##D # apply for nested.datlist
##D res1c <- with( datlist1b, stats::glm( ASMMAT ~ migrant + female ) )
##D 
##D # use within function for data transformations
##D datlist2 <- within( datlist1, {
##D                 highsc <- 1*(ASSSCI > 600)
##D                 books_dum <- 1*(books>=3)
##D                 rm(scsci)   # remove variable scsci
##D                     } )
##D 
##D # include random number in each dataset
##D N <- attr( datlist1b, "nobs")
##D datlist3 <- within( datlist1b, {
##D                 rn <- stats::runif( N, 0, .5 )
##D                     } )
##D 
##D #-- some applications of withPool_NMI
##D # mean and SD
##D res3a <- with( imp1, c( "m1"=mean(ASMMAT), "sd1"=stats::sd(ASMMAT) ) )
##D withPool_NMI(res3a)
##D # quantiles
##D vars <- c("ASMMAT", "lang", "scsci")
##D res3b <- with( datlist1b, fun=function(data){
##D                 dat <- data[,vars]
##D                 res0 <- sapply( vars, FUN=function(vv){
##D                     stats::quantile( dat[,vv], probs=c(.25, .50, .75) )
##D                                     } )
##D                 t(res0)
##D                     } )
##D withPool_NMI(res3b)
## End(Not run)



