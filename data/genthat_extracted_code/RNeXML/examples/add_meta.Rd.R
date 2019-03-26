library(RNeXML)


### Name: add_meta
### Title: Add metadata to a nexml file
### Aliases: add_meta

### ** Examples

## Create a new nexml object with a single metadata element: 
modified <- meta(property = "prism:modificationDate", content = "2013-10-04")
nex <- add_meta(modified) # Note: 'prism' is defined in nexml_namespaces by default.  

## Write multiple metadata elements, including a new namespace:  
website <- meta(href = "http://carlboettiger.info", 
                rel = "foaf:homepage")              # meta can be link-style metadata
nex <- add_meta(list(modified,  website), 
                namespaces = c(foaf = "http://xmlns.com/foaf/0.1/"))

## Append more metadata, and specify a level: 
history <- meta(property = "skos:historyNote",
                 content = "Mapped from the bird.orders data in the ape package using RNeXML")
nex <- add_meta(history, 
                nexml = nex,
                level = "trees",
                namespaces = c(skos = "http://www.w3.org/2004/02/skos/core#"))




