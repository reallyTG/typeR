library(taxize)


### Name: ncbi_downstream
### Title: Retrieve all taxa names downstream in hierarchy for NCBI
### Aliases: ncbi_downstream

### ** Examples

## Not run: 
##D ## genus Apis
##D ncbi_downstream(id = 7459, downto="species")
##D 
##D ## get intermediate taxa as a separate object
##D ncbi_downstream(id = 7459, downto="species", intermediate = TRUE)
##D 
##D ## get intermediate taxa as a separate object
##D ncbi_downstream(id = 7459, downto="species", intermediate = TRUE)
##D 
##D ## Lepidoptera
##D ncbi_downstream(id = 7088, downto="superfamily")
##D 
##D ## families in the ferns (Moniliformopses)
##D (id <- get_uid("Moniliformopses"))
##D ncbi_downstream(id = id, downto = "order")
## End(Not run)



