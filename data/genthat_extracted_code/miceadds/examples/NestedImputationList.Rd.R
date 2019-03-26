library(miceadds)


### Name: NestedImputationList
### Title: Functions for Analysis of Nested Multiply Imputed Datasets
### Aliases: NestedImputationList MIcombine.NestedImputationResultList
###   print.NestedImputationList
### Keywords: Nested multiple imputation

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Nested multiple imputation and conversion into an object of class
##D #            NestedImputationList
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
##D imp1 <- miceadds::mice.nmi( datlist,  m=3, maxit=2 )
##D summary(imp1)
##D 
##D # create object of class NestedImputationList
##D datlist1 <- miceadds::mids2datlist( imp1 )
##D datlist1 <- miceadds::NestedImputationList( datlist1 )
##D 
##D # estimate linear model using with
##D res1 <- with( datlist1, stats::lm( ASMMAT ~ female + migrant ) )
##D # pool results
##D mres1 <- mitools::MIcombine( res1 )
##D summary(mres1)
##D coef(mres1)
##D vcov(mres1)
## End(Not run)



