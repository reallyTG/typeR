library(miceadds)


### Name: visitSequence.determine
### Title: Automatic Determination of a Visit Sequence in 'mice'
### Aliases: visitSequence.determine

### ** Examples

#############################################################################
# EXAMPLE 1: Visit sequence for a small imputation model
#############################################################################

data( data.smallscale )
# select a small number of variables
dat <- data.smallscale[, paste0("v",1:4) ]
V <- ncol(dat)

# define initial vector of imputation methods
impMethod <- rep("norm", V)
names(impMethod) <- colnames(dat)
# define variable names and imputation method for passive variables in a data frame
dfr.impMeth <- data.frame( "variable"=NA,
                  "impMethod"=NA )
dfr.impMeth[1,] <- c("v1_v1", "~ I(v1^2)" )
dfr.impMeth[2,] <- c("v2_v4", "~ I(v2*v4)" )
dfr.impMeth[3,] <- c("v4log", "~ I( log(abs(v4)))" )
dfr.impMeth[4,] <- c("v12", "~ I( v1 + v2 + 3*v1_v1 - v2_v4 )" )
# add variables to dataset and imputation methods
VV <- nrow(dfr.impMeth)
for (vv in 1:VV){
    impMethod[ dfr.impMeth[vv,1] ] <- dfr.impMeth[vv,2]
    dat[, dfr.impMeth[vv,1] ] <- NA
}

# run empty imputation model to obtain initial vector of visit sequence
imp0 <- mice::mice( dat, m=1, method=impMethod, maxit=0 )
imp0$vis

# update visit sequence
vis1 <- miceadds::visitSequence.determine( impMethod=impMethod, vis=imp0$vis, data=dat)

# imputation with updated visit sequence
imp <- mice::mice( dat, m=1, method=impMethod, visitSequence=vis1, maxit=2)



