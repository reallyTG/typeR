library(ALA4R)


### Name: specieslist
### Title: Get list of taxa and their occurrence counts
### Aliases: specieslist

### ** Examples

## Not run: 
##D x <- specieslist(taxon="genus:Hakea", wkt="POLYGON((145 -37,150 -37,150 -30,145 -30,145 -37))")
##D 
##D x <- specieslist(wkt="POLYGON((147.62 -42.83,147.60 -42.86,147.65 -42.87,147.70 -42.86,
##D   147.62 -42.83))", fq="rank:species")
##D 
##D x <- specieslist(wkt="POLYGON((145 -37,150 -37,150 -30,145 -30,145 -37))", fq="genus:Heleioporus")
##D 
##D x <- specieslist(wkt="POLYGON((152.38 -30.43,152.5 -30.43,152.5 -30.5,152.38 -30.5,152.38 -30.43))",
##D     fq="kingdom:Plantae")
##D ## NOTE that this response might include records with empty or NA kingdom, phylum, or
##D ##  class values, as per the note above.
## End(Not run)



