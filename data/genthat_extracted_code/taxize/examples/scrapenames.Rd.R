library(taxize)


### Name: scrapenames
### Title: Resolve names using Global Names Recognition and Discovery.
### Aliases: scrapenames

### ** Examples

## Not run: 
##D # Get data from a website using its URL
##D scrapenames('http://en.wikipedia.org/wiki/Araneae')
##D scrapenames('http://en.wikipedia.org/wiki/Animalia')
##D scrapenames('http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0095068')
##D scrapenames('http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0080498')
##D scrapenames('http://ucjeps.berkeley.edu/cgi-bin/get_JM_treatment.pl?CARYOPHYLLACEAE')
##D 
##D # Scrape names from a pdf at a URL
##D url <- 'http://www.plosone.org/article/fetchObject.action?uri=
##D info%3Adoi%2F10.1371%2Fjournal.pone.0058268&representation=PDF'
##D scrapenames(url = sub('\n', '', url))
##D 
##D # With arguments
##D scrapenames(url = 'http://www.mapress.com/zootaxa/2012/f/z03372p265f.pdf',
##D   unique=TRUE)
##D scrapenames(url = 'http://en.wikipedia.org/wiki/Araneae',
##D   data_source_ids=c(1, 169))
##D 
##D # Get data from a file
##D speciesfile <- system.file("examples", "species.txt", package = "taxize")
##D scrapenames(file = speciesfile)
##D 
##D nms <- paste0(names_list("species"), collapse="\n")
##D file <- tempfile(fileext = ".txt")
##D writeLines(nms, file)
##D scrapenames(file = file)
##D 
##D # Get data from text string
##D scrapenames(text='A spider named Pardosa moesta Banks, 1892')
##D 
##D # return OCR content
##D scrapenames(url='http://www.mapress.com/zootaxa/2012/f/z03372p265f.pdf',
##D   return_content = TRUE)
##D 
##D # use curl options
##D library("httr")
##D scrapenames(text='A spider named Pardosa moesta Banks, 1892')
## End(Not run)



