library(aRxiv)


### Name: arxiv_search
### Title: The main search function for aRxiv
### Aliases: arxiv_search

### ** Examples

## Don't show: 
old_delay <- getOption("aRxiv_delay")
          options(aRxiv_delay=1)
## End(Don't show)
## No test: 
# search for author Peter Hall with deconvolution in title
z <- arxiv_search(query = 'au:"Peter Hall" AND ti:deconvolution', limit=2)
attr(z, "total_results") # total no. records matching query
z$title

# search for a set of documents by arxiv identifiers
z <- arxiv_search(id_list = c("0710.3491v1", "0804.0713v1", "1003.0315v1"))
# can also use a comma-separated string
z <- arxiv_search(id_list = "0710.3491v1,0804.0713v1,1003.0315v1")
# Journal references, if available
z$journal_ref

# search for a range of dates (in this case, one day)
z <- arxiv_search("submittedDate:[199701010000 TO 199701012400]", limit=2)
## End(No test)
## Don't show: 
options(aRxiv_delay=old_delay)
## End(Don't show)




