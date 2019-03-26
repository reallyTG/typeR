library(miceadds)


### Name: GroupMean
### Title: Calculation of Groupwise Descriptive Statistics for Matrices
### Aliases: GroupMean GroupSum GroupSD gm cwc
### Keywords: Utility function

### ** Examples

#############################################################################
# EXAMPLE 1: Group means and SDs data.ma02
#############################################################################

data(data.ma02, package="miceadds" )
dat <- data.ma02[[1]] # select first dataset

#--- group means for read and math
GroupMean( dat[, c("read","math") ], group=dat$idschool )
# using rowsum
a1 <- base::rowsum( dat[, c("read","math") ], dat$idschool )
a2 <- base::rowsum( 1+0*dat[, c("read","math") ], dat$idschool )
(a1/a2)[1:10,]
# using aggregate
stats::aggregate(  dat[, c("read","math") ], list(dat$idschool), mean )[1:10,]

#--- extend group means to original dataset
GroupMean( dat[, c("read","math") ], group=dat$idschool, extend=TRUE )
# using ave
stats::ave( dat[, "read" ], dat$idschool  )
stats::ave( dat[, "read" ], dat$idschool, FUN=mean )

## Not run: 
##D #--- group standard deviations
##D GroupSD( dat[, c("read","math") ], group=dat$idschool)[1:10,]
##D # using aggregate
##D stats::aggregate(  dat[, c("read","math") ], list(dat$idschool), sd )[1:10,]
##D 
##D #############################################################################
##D # EXAMPLE 2: Calculating group means and group mean centering
##D #############################################################################
##D 
##D data(data.ma07, package="miceadds")
##D dat <- data.ma07
##D 
##D # compute group means
##D miceadds::gm( dat$x1, dat$id2 )
##D # centering within clusters
##D miceadds::cwc( dat$x1, dat$id2 )
##D 
##D # evaluate formula with model.matrix
##D X <- model.matrix( ~ I( miceadds::cwc(x1, id2) ) + I( miceadds::gm(x1,id2) ), data=dat )
##D head(X)
## End(Not run)



