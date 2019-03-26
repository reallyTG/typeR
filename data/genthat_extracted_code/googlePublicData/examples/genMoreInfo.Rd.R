library(googlePublicData)


### Name: genMoreInfo
### Title: Generates a dataframe used to complement a DSPL bundle
### Aliases: genMoreInfo
### Keywords: IO

### ** Examples


# Getting the path where all the datasets are
path <- system.file("dspl-tutorial", package="googlePublicData")
info <- genMoreInfo(path) # This is a dataframe

# Setting the 5th concept as topic "Demographics"
info[5, "topic"] <- "Demographics"

# Generating the dspl file
ans <- dspl(path, moreinfo = info)
ans

  ## Not run: 
##D     # Parsing some xlsx files at "my stats folder" to gen a "moreinfo" dataframe
##D     INFO <- genMoreInfo(path="my stats folder/", sep="xls")
##D     
##D     # Rows 1 to 10 are about "Poverty" and rows 11 to 20 about "Education"
##D     # So we fill the "topic" column with it.
##D     INFO$topic[1:10] <- "Poverty"
##D     INFO$topic[11:20] <- "Education"
##D     
##D     # Finally, we build the DSPL ZIP including more info
##D     dspl(path="my stats folder/", sep="xls", moreinfo=INFO)
##D     
##D   
## End(Not run)



