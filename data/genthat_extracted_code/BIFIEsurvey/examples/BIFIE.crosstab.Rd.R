library(BIFIEsurvey)


### Name: BIFIE.crosstab
### Title: Cross Tabulation
### Aliases: BIFIE.crosstab summary.BIFIE.crosstab coef.BIFIE.crosstab
###   vcov.BIFIE.crosstab
### Keywords: Descriptive statistics summary coef vcov

### ** Examples

#############################################################################
# EXAMPLE 1: Imputed TIMSS dataset
#############################################################################

data(data.timss1)
data(data.timssrep)

# create BIFIE.dat object
bifieobj <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
           wgtrep=data.timssrep[, -1 ] )

#--- Model 1: cross tabulation
res1 <- BIFIEsurvey::BIFIE.crosstab( bifieobj, vars1="migrant",
               vars2="books", group="female" )
summary(res1)



