library(factualR)


### Name: factualR
### Title: common functions in the factualR package
### Aliases: factualR createFactualConnection factualGetSchema factualRead

### ** Examples

## Not run: 
##D ## make sure you have signed up for a developer API key at http://www.factual.com/
##D 
##D myAPIKey <- " ... YOUR Factual.com API KEY"
##D 
##D factual <- createFactualConnection( myAPIKey )
##D 
##D ## Skim http://www.factual.com/topics for an interesting table.  Click the table's
##D ## link and then click the "develop" tab.  Note the "table reference."
##D tableID <- "... table reference from the table's 'Develop' tab ..."
##D 
##D ## now, let's get an idea of the table's schema and metadata:
##D table.meta <- factualGetSchema( factual , tableID )
##D 
##D str(table.meta)
##D 
##D ## with that in mind, get the table's data
##D table.data <- factualRead( factual , tableID )
##D 
##D ## get an idea of the result object
##D str(table.data)
##D 
##D ## that's great, but we really want to play with the table data
##D ## (it's a data frame)
##D table.data@results
##D 
##D 
##D ## hm, let's get 60 rows so we can explore
##D table.data.small <- factualRead( factual , tableID , limit=60 )
##D 
##D str(table.data.small@results)
##D 
##D 
##D ## let's use some filters to limit the data we pull.
##D ## pretend the table of interest has colums named "state"
##D ## and "city"
##D filters <- '{"city":"New York","state":"NY"}'
##D 
##D table.data.filtered <- factualRead( factual , tableID , filters = filters )
##D str(table.data.small@filtered)
## End(Not run)



