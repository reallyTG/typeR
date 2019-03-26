library(googleAuthR)


### Name: gar_api_page
### Title: Takes a generated API function and lets you page through results
### Aliases: gar_api_page

### ** Examples


## Not run: 
##D # demos the two methods for the same function.
##D # The example is for the Google Analytics management API, 
##D #  you need to authenticate with that to run them. 
##D 
##D 
##D # paging by using nextLink that is returned in API response
##D ga_segment_list1 <- function(){
##D 
##D   # this URL will be modified by using the url_override argument in the generated function
##D   segs <- gar_api_generator("https://www.googleapis.com/analytics/v3/management/segments",
##D                             "GET",
##D                             pars_args = list("max-results"=10),
##D                             data_parse_function = function(x) x)
##D                          
##D                          
##D   gar_api_page(segs, 
##D                page_method = "url",
##D                page_f = function(x) x$nextLink)
##D 
##D }
##D 
##D # paging by looking for the next start-index parameter
##D 
##D ## start by creating the function that will output the correct start-index
##D paging_function <- function(x){
##D   next_entry <- x$startIndex + x$itemsPerPage
##D 
##D   # we have all results e.g. 1001 > 1000
##D   if(next_entry > x$totalResults){
##D     return(NULL)
##D   }
##D 
##D   next_entry
##D   }
##D   
##D ## remember to add the paging argument (start-index) to the generated function too, 
##D ##  so it can be modified.    
##D ga_segment_list2 <- function(){
##D 
##D   segs <- gar_api_generator("https://www.googleapis.com/analytics/v3/management/segments",
##D                            "GET",
##D                             pars_args = list("start-index" = 1,
##D                                              "max-results"=10),
##D                             data_parse_function = function(x) x)
##D                            
##D   gar_api_page(segs, 
##D                page_method = "param",
##D                page_f = paging_function,
##D                page_arg = "start-index")
##D 
##D   }
##D 
##D 
##D identical(ga_segment_list1(), ga_segment_list2())
##D 
##D 
## End(Not run)
 



