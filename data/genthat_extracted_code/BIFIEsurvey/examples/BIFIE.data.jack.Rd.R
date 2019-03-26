library(BIFIEsurvey)


### Name: BIFIE.data.jack
### Title: Create 'BIFIE.data' Object with Jackknife Zones
### Aliases: BIFIE.data.jack
### Keywords: BIFIEdata

### ** Examples

#############################################################################
# EXAMPLE 1: Convert TIMSS dataset to BIFIE.data object
#############################################################################

data(data.timss3)

# define plausible values
pv_vars <- c("ASMMAT", "ASSSCI" )
# create BIFIE.data objects -> 5 imputed datasets
bdat1 <- BIFIEsurvey::BIFIE.data.jack( data=data.timss3,  pv_vars=pv_vars,
             jktype="JK_TIMSS"  )
summary(bdat1)

# create BIFIE.data objects -> all PVs are included in one dataset
bdat2 <- BIFIEsurvey::BIFIE.data.jack( data=data.timss3,  jktype="JK_TIMSS"  )
summary(bdat2)

#############################################################################
# EXAMPLE 2: Creation of Jackknife zones and replicate weights for data.test1
#############################################################################

data(data.test1)

# create jackknife zones based on random group creation
bdat1 <- BIFIEsurvey::BIFIE.data.jack( data=data.test1,  jktype="JK_RANDOM",
                    ngr=50 )
summary(bdat1)
stat1 <- BIFIEsurvey::BIFIE.univar( bdat1, vars="math",  group="stratum" )
summary(stat1)

# random creation of groups and inclusion of weights
bdat2 <- BIFIEsurvey::BIFIE.data.jack( data=data.test1,  jktype="JK_RANDOM",
                ngr=75, seed=987, wgt="wgtstud")
summary(bdat2)
stat2 <- BIFIEsurvey::BIFIE.univar( bdat2, vars="math",  group="stratum" )
summary(stat2)

# using idclass as jackknife zones
bdat3 <- BIFIEsurvey::BIFIE.data.jack( data=data.test1,  jktype="JK_GROUP",
                jkzone="idclass", wgt="wgtstud")
summary(bdat3)
stat3 <- BIFIEsurvey::BIFIE.univar( bdat3, vars="math",  group="stratum" )
summary(stat3)

# create BIFIEdata object with a list of imputed datasets
dataList <- list( data.test1, data.test1, data.test1 )
bdat4 <- BIFIEsurvey::BIFIE.data.jack( data=dataList,  jktype="JK_GROUP",
                jkzone="idclass", wgt="wgtstud")
summary(bdat4)

## Not run: 
##D #############################################################################
##D # EXAMPLE 3: Converting a PISA dataset into a BIFIEdata object
##D #############################################################################
##D 
##D data(data.pisaNLD)
##D 
##D # BIFIEdata with cdata=FALSE
##D bifieobj <- BIFIEsurvey::BIFIE.data.jack( data.pisaNLD, jktype="RW_PISA", cdata=FALSE)
##D summary(bifieobj)
##D # BIFIEdata with cdata=TRUE
##D bifieobj1 <- BIFIEsurvey::BIFIE.data.jack( data.pisaNLD, jktype="RW_PISA", cdata=TRUE)
##D summary(bifieobj1)
## End(Not run)



