library(BIFIEsurvey)


### Name: BIFIE.univar
### Title: Univariate Descriptive Statistics (Means and Standard
###   Deviations)
### Aliases: BIFIE.univar summary.BIFIE.univar coef.BIFIE.univar
###   vcov.BIFIE.univar
### Keywords: Descriptive statistics summary coef vcov

### ** Examples

#############################################################################
# EXAMPLE 1: Imputed TIMSS dataset
#############################################################################

data(data.timss1)
data(data.timssrep)

# create BIFIE.dat object
bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
           wgtrep=data.timssrep[, -1 ] )

# compute descriptives for plausible values
res1 <- BIFIEsurvey::BIFIE.univar( bdat, vars=c("ASMMAT","ASSSCI","books") )
summary(res1)

# split descriptives by number of books
res2 <- BIFIEsurvey::BIFIE.univar( bdat, vars=c("ASMMAT","ASSSCI"), group="books",
            group_values=1:5)
summary(res2)

#############################################################################
# EXAMPLE 2: TIMSS dataset with missings
#############################################################################

data(data.timss2)
data(data.timssrep)

# use first dataset with missing data from data.timss2
bdat1 <- BIFIEsurvey::BIFIE.data( data.list=data.timss2[[1]], wgt=data.timss2[[1]]$TOTWGT,
               wgtrep=data.timssrep[, -1 ])

# some descriptive statistics without statistical inference
res1a <- BIFIEsurvey::BIFIE.univar( bdat1, vars=c("ASMMAT","ASSSCI","books"), se=FALSE)
# descriptive statistics with statistical inference
res1b <- BIFIEsurvey::BIFIE.univar( bdat1, vars=c("ASMMAT","ASSSCI","books") )
summary(res1a)
summary(res1b)

# split descriptives by number of books
res2 <- BIFIEsurvey::BIFIE.univar( bdat1, vars=c("ASMMAT","ASSSCI"), group="books")
# Note that if group_values is not specified as an argument it will be
# automatically determined by the observed frequencies in the dataset
summary(res2)



