library(webchem)


### Name: ci_query
### Title: Retrieve information from ChemIDPlus <URL:
###   http://chem.sis.nlm.nih.gov/chemidplus>
### Aliases: ci_query

### ** Examples

## Not run: 
##D # might fail if API is not available
##D # query common name
##D y1 <- ci_query(c('Formaldehyde', 'Triclosan'), type = 'name')
##D names(y1)
##D str(y1[['Triclosan']]) # lots of information inside
##D y1[['Triclosan']]$inchikey
##D 
##D # Query by CAS
##D y2 <- ci_query('50-00-0', type = 'rn', match = 'first')
##D y2[['50-00-0']]$inchikey
##D 
##D # query by inchikey
##D y3 <- ci_query('WSFSSNUMVMOOMR-UHFFFAOYSA-N', type = 'inchikey')
##D y3[[1]]$name
##D 
##D # extract lop-P
##D sapply(y1, function(y){
##D  if (length(y) == 1 && is.na(y))
##D    return(NA)
##D  y$physprop$Value[y$physprop$`Physical Property` == 'log P (octanol-water)']
##D  })
## End(Not run)



