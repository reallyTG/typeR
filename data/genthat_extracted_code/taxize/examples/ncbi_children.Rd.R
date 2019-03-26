library(taxize)


### Name: ncbi_children
### Title: Search NCBI for children of a taxon
### Aliases: ncbi_children

### ** Examples

## Not run: 
##D ncbi_children(name="Satyrium") #Satyrium is the name of two different genera
##D ncbi_children(name="Satyrium", ancestor="Eumaeini") # A genus of butterflies
##D ncbi_children(name="Satyrium", ancestor="Orchidaceae") # A genus of orchids
##D ncbi_children(id="266948") #"266948" is the uid for the butterfly genus
##D ncbi_children(id="62858") #"62858" is the uid for the orchid genus
##D 
##D # use curl options
##D ncbi_children(name="Satyrium", ancestor="Eumaeini", verbose = TRUE)
## End(Not run)



