library(BIFIEsurvey)


### Name: BIFIE.correl
### Title: Correlations and Covariances
### Aliases: BIFIE.correl summary.BIFIE.correl coef.BIFIE.correl
###   vcov.BIFIE.correl
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

# Correlations splitted by gender
res1 <- BIFIEsurvey::BIFIE.correl( bdat, vars=c("lang", "books", "migrant" ),
              group="female", group_values=0:1 )
summary(res1)

# Correlations splitted by gender: no statistical inference (se=FALSE)
res1a <- BIFIEsurvey::BIFIE.correl( bdat, vars=c("lang", "books", "migrant" ),
              group="female", group_values=0:1, se=FALSE)
summary(res1a)



