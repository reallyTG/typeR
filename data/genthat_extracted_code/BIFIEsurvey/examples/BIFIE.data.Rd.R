library(BIFIEsurvey)


### Name: BIFIE.data
### Title: Creates an Object of Class 'BIFIEdata'
### Aliases: BIFIE.data summary.BIFIEdata print.BIFIEdata
### Keywords: BIFIEdata summary print

### ** Examples

#############################################################################
# EXAMPLE 1: Create BIFIEdata object with multiply-imputed TIMSS data
#############################################################################
data(data.timss1)
data(data.timssrep)

bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
            wgtrep=data.timssrep[, -1 ] )
summary(bdat)
# create BIFIEdata object in a compact way
bdat2 <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
            wgtrep=data.timssrep[, -1 ], cdata=TRUE)
summary(bdat2)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Create BIFIEdata object with one dataset
##D #############################################################################
##D data(data.timss2)
##D 
##D # use first dataset with missing data from data.timss2
##D bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss2[[1]], wgt=data.timss2[[1]]$TOTWGT)
## End(Not run)

#############################################################################
# EXAMPLE 3: BIFIEdata objects with finite sampling correction
#############################################################################

data(data.timss1)
data(data.timssrep)

#-----
# BIFIEdata object without finite sampling correction
bdat1 <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
            wgtrep=data.timssrep[, -1 ] )
summary(bdat1)

#-----
# generate BIFIEdata object with finite sampling correction by adjusting
# the "fayfac" factor
bdat2 <- bdat1
#-- modify "fayfac" constant
fayfac0 <- bdat1$fayfac
# set fayfac=.75 for the first 50 replication zones (25% of students in the
# population were sampled) and fayfac=.20 for replication zones 51-75
# (meaning that 80% of students were sampled)
fayfac <- rep( fayfac0, bdat1$RR )
fayfac[1:50] <- fayfac0 * .75
fayfac[51:75] <- fayfac0 * .20
# include this modified "fayfac" factor in bdat2
bdat2$fayfac <- fayfac
summary(bdat2)
summary(bdat1)

#---- compare some univariate statistics
# no finite sampling correction
res1 <- BIFIEsurvey::BIFIE.univar( bdat1, vars="ASMMAT")
summary(res1)
# finite sampling correction
res2 <- BIFIEsurvey::BIFIE.univar( bdat2, vars="ASMMAT")
summary(res2)

## Not run: 
##D #############################################################################
##D # EXAMPLE 4: Create BIFIEdata object with nested multiply imputed dataset
##D #############################################################################
##D 
##D data(data.timss4)
##D data(data.timssrep)
##D 
##D # nested imputed dataset, save it in compact format
##D bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss4,
##D             wgt=data.timss4[[1]][[1]]$TOTWGT, wgtrep=data.timssrep[, -1 ],
##D             NMI=TRUE, cdata=TRUE )
##D summary(bdat)
## End(Not run)



