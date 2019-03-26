library(ibmdbR)


### Name: idaTable
### Title: In-Database Cross Tabulation and Table Creation
### Aliases: idaTable

### ** Examples

## Not run: 
##D 
##D #Create a pointer to the table IRIS
##D idf<-ida.data.frame('IRIS')
##D 
##D #Add a column
##D idf$SepalLengthg4 <- ifelse(idf$SepalLength>4,'t','f')
##D 
##D #Calculate the cross-table between Species and SepalLengthg4
##D idaTable(idf[,c('Species','SepalLengthg4')])
##D 
## End(Not run)



