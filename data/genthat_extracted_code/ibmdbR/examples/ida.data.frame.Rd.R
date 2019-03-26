library(ibmdbR)


### Name: ida.data.frame, is.ida.data.frame
### Title: Create an IDA data frame
### Aliases: ida.data.frame is.ida.data.frame

### ** Examples

## Not run: 
##D idf <- ida.data.frame('IRIS')
##D is.ida.data.frame(idf)
##D 
##D #Select only certain rows or columns
##D #The following creates an ida.data.frame that only selects rows with
##D #Species=='setosa' and the first three columns of the table
##D idf2 <- idf[idf$Species=='setosa',1:3]
##D 
##D #Define new columns based on existing ones
##D idf$SepalLengthX <- idf$SepalLength+1
##D idf$SepalLengthY <- ifelse(idf$SepalLengthX>4.5,idf$ID,10)
##D 
##D #Take a look at the newly defined columns
##D head(idf)
##D 
##D  
## End(Not run)



