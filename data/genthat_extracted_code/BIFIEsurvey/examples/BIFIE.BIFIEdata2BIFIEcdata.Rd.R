library(BIFIEsurvey)


### Name: BIFIE.BIFIEdata2BIFIEcdata
### Title: Conversion and Selection of 'BIFIEdata' Objects
### Aliases: BIFIE.BIFIEdata2BIFIEcdata BIFIE.BIFIEcdata2BIFIEdata
###   BIFIE.BIFIEdata2datalist
### Keywords: BIFIEdata

### ** Examples

#############################################################################
# EXAMPLE 1: BIFIEdata conversions using data.timss1 dataset
#############################################################################
data(data.timss1)
data(data.timssrep)

# create BIFIEdata object
bdat1 <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
            wgtrep=data.timssrep[, -1 ])
summary(bdat1)

# convert BIFIEdata object bdat1 into a BIFIEcdata object with
#  only using the first three datasets and a variable selection
bdat2 <- BIFIEsurvey::BIFIE.BIFIEdata2BIFIEcdata( bifieobj=bdat1,
                varnames=bdat1$varnames[ c(1:7,10) ] )

# convert bdat2 into BIFIEdata object and only use the first three imputed datasets
bdat3 <- BIFIEsurvey::BIFIE.BIFIEcdata2BIFIEdata( bifieobj=bdat2, impdata.index=1:3)

# object summaries
summary(bdat1)
summary(bdat2)
summary(bdat3)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Extract unique elements in BIFIEdata object
##D #############################################################################
##D 
##D data(data.timss1)
##D data(data.timssrep)
##D 
##D # create BIFIEdata object
##D bifieobj <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
##D             wgtrep=data.timssrep[, -1 ])
##D summary(bifieobj)
##D 
##D # define variables for which unique values should be extracted
##D vars <- c( "female", "books","ASMMAT" )
##D # convert these variables from BIFIEdata object into a list of datasets
##D bdatlist <- BIFIEsurvey::BIFIE.BIFIEdata2datalist( bifieobj, varnames=vars )
##D # look for unique values in first dataset for variables
##D values <- lapply( bdatlist[[1]], FUN=function(vv){
##D                 sort( unique( vv ) ) } )
##D # number of unique values in first dataset
##D Nvalues <- lapply( bdatlist[[1]], FUN=function(vv){
##D                 length( unique( vv ) ) } )
##D # number of unique values in all datasets
##D Nvalues2 <- lapply( vars, FUN=function(vv){
##D     #vv <- vars[1]
##D     unlist( lapply( bdatlist, FUN=function(dd){
##D                 length( unique( dd[,vv]  ) )
##D                         }    )     )
##D                     } )
##D # --> for extracting the number of unique values using BIFIE.by and a user
##D #     defined function see Example 1, Model 3 in "BIFIE.by"
## End(Not run)



