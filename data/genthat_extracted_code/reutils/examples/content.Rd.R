library(reutils)


### Name: content
### Title: Extract the data content from an Entrez request
### Aliases: content content,ecitmatch-method content,efetch-method
###   content,egquery-method content,einfo-method content,elink-method
###   content,epost-method content,esearch-method content,espell-method
###   content,esummary-method content,eutil-method

### ** Examples

## Not run: 
##D ## einfo() defaults to retmode 'xml'
##D e <- einfo()
##D 
##D ## automatically return data as an 'XMLInternalDocument'.
##D if (e$no_errors()) {
##D   content(e)
##D 
##D   ## return the XML data as character string.
##D   cat(content(e, "text"))
##D 
##D   ## return DbNames parsed into a character vector.
##D   content(e, "parsed")
##D }
##D 
##D ## return data as a JSON object
##D e2 <- einfo(db = "gene", retmode = "json")
##D if (e2$no_errors()) {
##D   content(e2)
##D }
##D 
##D ## return a textConnection to allow linewise reading of the data.
##D x <- efetch("CP000828", "nuccore", rettype = "gbwithparts", retmode = "text")
##D con <- content(x, as = "textConnection")
##D readLines(con, 2)
##D close(con)
## End(Not run)



