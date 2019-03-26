library(PGRdup)


### Name: KWIC
### Title: Create a KWIC Index
### Aliases: KWIC

### ** Examples

# Load PGR passport database
GN <- GN1000

# Specify as a vector the database fields to be used
GNfields <- c("NationalID", "CollNo", "DonorID", "OtherID1", "OtherID2")

# Clean the data
GN[GNfields] <- lapply(GN[GNfields], function(x) DataClean(x))

## Not run: 
##D 
##D # Generate KWIC index
##D GNKWIC <- KWIC(GN, GNfields)
##D GNKWIC
##D 
##D # Retrieve the KWIC index from the KWIC object
##D KWIC <- GNKWIC[[1]]
##D 
##D # Retrieve the keyword frequencies from the KWIC object
##D KeywordFreq <- GNKWIC[[2]]
##D 
##D # Show error in case of duplicates and NULL values 
##D # in the primary key/ID field "NationalID"
##D GN[1001:1005,] <- GN[1:5,]
##D GN[1001,3] <- ""
##D GNKWIC <- KWIC(GN, GNfields)
## End(Not run)



