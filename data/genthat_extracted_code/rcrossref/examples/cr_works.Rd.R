library(rcrossref)


### Name: cr_works
### Title: Search CrossRef works (articles)
### Aliases: cr_works cr_works_

### ** Examples

## Not run: 
##D # Works funded by the NSF
##D cr_works(query="NSF")
##D 
##D # Works that include renear but not ontologies
##D cr_works(query="renear+-ontologies")
##D 
##D # Filter
##D cr_works(query="global state", filter=c(has_orcid=TRUE), limit=3)
##D # Filter by multiple fields
##D cr_works(filter=c(has_orcid=TRUE, from_pub_date='2004-04-04'))
##D # Only full text articles
##D cr_works(filter=c(has_full_text = TRUE))
##D # has affilitation data
##D cr_works(filter=c(has_affiliation = TRUE))
##D # has abstract
##D cr_works(filter=c(has_abstract = TRUE))
##D # has clinical trial number
##D cr_works(filter=c(has_clinical_trial_number = TRUE))
##D 
##D # Querying dois
##D cr_works(dois='10.1063/1.3593378')
##D cr_works('10.1371/journal.pone.0033693')
##D cr_works(dois='10.1007/12080.1874-1746')
##D cr_works(dois=c('10.1007/12080.1874-1746','10.1007/10452.1573-5125',
##D    '10.1111/(issn)1442-9993'))
##D 
##D # progress bar
##D cr_works(dois=c('10.1007/12080.1874-1746','10.1007/10452.1573-5125'),
##D    .progress="text")
##D 
##D # Include facetting in results
##D cr_works(query="NSF", facet=TRUE)
##D ## Get facets only, by setting limit=0
##D cr_works(query="NSF", facet=TRUE, limit=0)
##D ## you can also set facet to a query
##D cr_works(facet = "license:*", limit=0)
##D 
##D # Sort results
##D cr_works(query="ecology", sort='relevance', order="asc")
##D res <- cr_works(query="ecology", sort='score', order="asc")
##D res$data$score
##D cr_works(query="ecology", sort='published')
##D x=cr_works(query="ecology", sort='published-print')
##D x=cr_works(query="ecology", sort='published-online')
##D 
##D # Get a random number of results
##D cr_works(sample=1)
##D cr_works(sample=10)
##D 
##D # You can pass in dot separated fields to filter on specific fields
##D cr_works(filter=c(award.number='CBET-0756451',
##D    award.funder='10.13039/100000001'))
##D 
##D # Use the cursor for deep paging
##D cr_works(query="NSF", cursor = "*", cursor_max = 300, limit = 100)
##D cr_works(query="NSF", cursor = "*", cursor_max = 300, limit = 100,
##D    facet = TRUE)
##D 
##D # Low level function - does no parsing to data.frame, get json or a list
##D cr_works_(query = "NSF")
##D cr_works_(query = "NSF", parse=TRUE)
##D cr_works_(query="NSF", cursor = "*", cursor_max = 300, limit = 100)
##D cr_works_(query="NSF", cursor = "*", cursor_max = 300, limit = 100,
##D    parse=TRUE)
##D 
##D # field queries
##D ## query.author
##D res <- cr_works(query = "ecology", flq = c(query.author = 'Boettiger'))
##D 
##D ## query.container-title
##D res <- cr_works(query = "ecology",
##D   flq = c(`query.container-title` = 'Ecology'))
##D 
##D ## query.author and query.title
##D res <- cr_works(query = "ecology",
##D   flq = c(query.author = 'Smith', query.title = 'cell'))
##D 
##D # select only certain fields to return
##D res <- cr_works(query = "NSF", select = c('DOI', 'title'))
##D names(res$data)
##D 
##D # asyc
##D queries <- c("ecology", "science", "cellular", "birds", "European",
##D   "bears", "beets", "laughter", "hapiness", "funding")
##D res <- cr_works(query = queries, async = TRUE)
##D res_json <- cr_works_(query = queries, async = TRUE)
##D unname(vapply(res_json, class, ""))
##D jsonlite::fromJSON(res_json[[1]])
##D 
##D queries <- c("ecology", "science", "cellular")
##D res <- cr_works(query = queries, async = TRUE, verbose = TRUE)
##D res
##D 
##D # time
##D queries <- c("ecology", "science", "cellular", "birds", "European",
##D   "bears", "beets", "laughter", "hapiness", "funding")
##D system.time(cr_works(query = queries, async = TRUE))
##D system.time(lapply(queries, function(z) cr_works(query = z)))
## End(Not run)



