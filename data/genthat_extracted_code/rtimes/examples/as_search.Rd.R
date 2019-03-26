library(rtimes)


### Name: as_search
### Title: Article search
### Aliases: as_search

### ** Examples

## Not run: 
##D # basic search - copyright, metadata, data, and facet slots
##D (x <- as_search(q="bailout", begin_date = "20081001", 
##D   end_date = '20081005'))
##D x$copyright
##D x$meta
##D x$data
##D x$facet
##D Sys.sleep(1)
##D 
##D as_search(q="money", fq = 'The New York Times', fl = c('word_count', 
##D   'snippet', 'headline'))
##D Sys.sleep(1)
##D x <- as_search(q="bailout", hl = TRUE)
##D x$data$snippet
##D Sys.sleep(1)
##D 
##D # all results
##D (x <- as_search(q="bailout", begin_date = "20081001", 
##D   end_date = '20081003', all_results = TRUE))
##D x$meta
##D x$data
##D Sys.sleep(1)
##D 
##D # facetting
##D as_search(q="bailout", facet_field = 'section_name', begin_date = "20081001",
##D    end_date = '20081201')
##D Sys.sleep(1)
##D ## with facet filtering
##D as_search(q="bailout", facet_field = 'section_name', begin_date = "20081001",
##D    end_date = '20081201', facet_filter = TRUE)
##D    
##D # curl options
##D x <- as_search(q="bailout", begin_date = "20081001", 
##D   end_date = '20081005', callopts = list(verbose = TRUE))
## End(Not run)



