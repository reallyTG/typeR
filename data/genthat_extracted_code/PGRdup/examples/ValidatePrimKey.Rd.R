library(PGRdup)


### Name: ValidatePrimKey
### Title: Validate if a data frame column confirms to primary key/ID
###   constraints
### Aliases: ValidatePrimKey

### ** Examples

GN <- GN1000
ValidatePrimKey(x=GN, prim.key="NationalID")
## Not run: 
##D # Show error in case of duplicates and NULL values 
##D # in the primary key/ID field "NationalID"
##D GN[1001:1005,] <- GN[1:5,]
##D GN[1001,3] <- ""
##D ValidatePrimKey(x=GN, prim.key="NationalID")
## End(Not run)



