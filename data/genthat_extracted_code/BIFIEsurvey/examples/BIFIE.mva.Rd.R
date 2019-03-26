library(BIFIEsurvey)


### Name: BIFIE.mva
### Title: Missing Value Analysis
### Aliases: BIFIE.mva summary.BIFIE.mva
### Keywords: Missing value analysis summary

### ** Examples

#############################################################################
# EXAMPLE 1: Imputed TIMSS dataset
#############################################################################

data(data.timss1)
data(data.timssrep)

# create BIFIE.dat object
BIFIEdata <- BIFIEsurvey::BIFIE.data( data.list=data.timss1,
                wgt=data.timss1[[1]]$TOTWGT, wgtrep=data.timssrep[, -1 ] )

# missing value analysis for "scsci" and "books" and three covariates
res1 <- BIFIEsurvey::BIFIE.mva( BIFIEdata, missvars=c("scsci", "books" ),
             covariates=c("ASMMAT", "female", "ASSSCI") )
summary(res1)

# missing value analysis without statistical inference and without covariates
res2 <- BIFIEsurvey::BIFIE.mva( BIFIEdata, missvars=c("scsci", "books"), se=FALSE)
summary(res2)



