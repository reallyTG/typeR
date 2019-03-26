library(RonFHIR)


### Name: searchParams
### Title: searchParams
### Aliases: searchParams

### ** Examples

## Not run: 
##D # Setting up a fhirClient
##D client <- fhirClient$new("http://vonk.furore.com")
##D 
##D # Creating a new searchParams object
##D query <- searchParams$new()
##D query$select(c("name", "birthDate"))$where("given:exact=Peter")$orderBy("family")
##D 
##D 
##D peters <- client$searchByQuery(query, "Patient")
##D # equivalent:
##D # client$search("Patient", c("_elements=name,birthDate","given:exact=Peter", "_sort=family"))
##D 
##D while(!is.null(bundle)){
##D    # Do something useful
##D    peters <- client$continue(peters)
##D }
## End(Not run)



