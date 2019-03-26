library(rdflib)


### Name: rdf_add
### Title: Add RDF Triples
### Aliases: rdf_add

### ** Examples

rdf <- rdf()
rdf_add(rdf, 
    subject="http://www.dajobe.org/",
    predicate="http://purl.org/dc/elements/1.1/language",
    object="en")
    
## non-URI string in subject indicates a blank subject
## (prefixes to "_:b0")
rdf_add(rdf, "b0", "http://schema.org/jobTitle", "Professor") 

## identically a blank subject.  
## Note rdf is unchanged when we add the same triple twice.
rdf_add(rdf, "b0", "http://schema.org/jobTitle", "Professor", 
        subjectType = "blank") 
        
## blank node with empty string creates a default blank node id
rdf_add(rdf, "", "http://schema.org/jobTitle", "Professor")   
                    

## Subject and Object both recognized as URI resources:
rdf_add(rdf, 
        "https://orcid.org/0000-0002-1642-628X",
        "http://schema.org/homepage", 
        "http://carlboettiger.info")  

 ## Force object to be literal, not URI resource        
rdf_add(rdf, 
        "https://orcid.org/0000-0002-1642-628X",
        "http://schema.org/homepage", 
        "http://carlboettiger.info",
        objectType = "literal")  
        




