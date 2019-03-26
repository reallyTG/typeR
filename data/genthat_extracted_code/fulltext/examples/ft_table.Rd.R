library(fulltext)


### Name: ft_table
### Title: Collect metadata and text into a data.frame
### Aliases: ft_table

### ** Examples

 
## Not run: 
##D ## from a directory path
##D x <- ft_table()
##D x
##D 
##D ## only xml
##D ft_table(type = "xml")
##D 
##D ## only pdf
##D ft_table(type = "pdf")
##D 
##D ## don't pull text out of xml, just give back the xml please
##D x <- ft_table(xml_extract_text = FALSE)
##D x
## End(Not run)



