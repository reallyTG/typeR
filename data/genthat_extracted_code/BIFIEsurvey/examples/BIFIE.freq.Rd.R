library(BIFIEsurvey)


### Name: BIFIE.freq
### Title: Frequency Statistics
### Aliases: BIFIE.freq summary.BIFIE.freq coef.BIFIE.freq vcov.BIFIE.freq
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

# Frequencies for three variables
res1 <- BIFIEsurvey::BIFIE.freq( bdat, vars=c("lang", "books", "migrant" )  )
summary(res1)

# Frequencies splitted by gender
res2 <- BIFIEsurvey::BIFIE.freq( bdat, vars=c("lang", "books", "migrant" ),
              group="female", group_values=0:1 )
summary(res2)

# Frequencies splitted by gender and likesc
res3 <- BIFIEsurvey::BIFIE.freq( bdat, vars=c("lang", "books", "migrant" ),
              group=c("likesc","female")  )
summary(res3)



