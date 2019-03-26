library(knitcitations)


### Name: bibliography
### Title: Generate the bibliography
### Aliases: bibliography

### ** Examples

citet(citation("httr"))
citet(citation("digest"))
bibliography()
bibliography(sorting = 'ynt') # sort by year, then name, title
bibliography(sorting = 'ydnt') # sort by year, descending, then name, title
cleanbib()

## No test: 
# these examples require an internet connection 
citet("Vos NeXML 2012")
citet("Boettiger Ross Hastings 2013")
bibliography(style="nature")
bibliography(style="nature", sorting = 'ynt') # obeys sorting rule 
## End(No test)



