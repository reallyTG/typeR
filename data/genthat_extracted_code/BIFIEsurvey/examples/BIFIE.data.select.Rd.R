library(BIFIEsurvey)


### Name: BIFIEdata.select
### Title: Selection of Variables and Imputed Datasets for Objects of Class
###   'BIFIEdata'
### Aliases: BIFIEdata.select
### Keywords: BIFIEdata

### ** Examples

#############################################################################
# EXAMPLE 1: Some manipulations of BIFIEdata objects created from data.timss1
#############################################################################
data(data.timss1)
data(data.timssrep)

# create BIFIEdata
bdat1 <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
            wgtrep=data.timssrep[, -1 ])
summary(bdat1)

# create BIFIEcdata object
bdat2 <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
            wgtrep=data.timssrep[, -1 ], cdata=TRUE )
summary(bdat2)

# selection of variables for BIFIEdata object
bdat1a <- BIFIEsurvey::BIFIEdata.select( bdat1, varnames=bdat1$varnames[ 1:7 ] )
# selection of variables and 1st, 2nd and 4th imputed datasets of BIFIEcdata object
bdat2a <- BIFIEsurvey::BIFIEdata.select( bdat2, varnames=bdat2$varnames[ 1:7 ],
                impdata.index=c(1,2,4) )
summary(bdat1a)
summary(bdat2a)



