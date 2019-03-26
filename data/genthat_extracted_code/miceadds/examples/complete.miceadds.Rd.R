library(miceadds)


### Name: complete.miceadds
### Title: Creates Imputed Dataset from a 'mids.nmi' or 'mids.1chain'
###   Object
### Aliases: complete.mids.nmi complete.mids.1chain
### Keywords: R utilities

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Nested multiple imputation and dataset extraction for TIMSS data
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
##D }
##D 
##D #***************
##D # (1) nested multiple imputation using mice
##D imp1 <- miceadds::mice.nmi( datlist,  m=4, maxit=3 )
##D summary(imp1)
##D 
##D #***************
##D # (2) nested multiple imputation using mice.1chain
##D imp2 <- miceadds::mice.nmi( datlist, Nimp=4, burnin=10,iter=22, type="mice.1chain")
##D summary(imp2)
##D 
##D #**************
##D # extract dataset for third orginal dataset the second within imputation
##D dat32a <- miceadds::complete.mids.nmi( imp1, action=c(3,2) )
##D dat32b <- miceadds::complete.mids.nmi( imp2, action=c(3,2) )
##D 
##D #############################################################################
##D # EXAMPLE 2: Imputation from one chain and extracting dataset for nhanes data
##D #############################################################################
##D 
##D library(mice)
##D data(nhanes, package="mice")
##D 
##D # nhanes data in one chain
##D imp1 <- miceadds::mice.1chain( nhanes, burnin=5, iter=40, Nimp=4,
##D             method=rep("norm", 4 ) )
##D 
##D # extract first imputed dataset
##D dati1 <- miceadds::complete.mids.1chain( imp1, action=1 )
## End(Not run)



