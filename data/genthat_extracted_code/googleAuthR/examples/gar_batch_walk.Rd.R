library(googleAuthR)


### Name: gar_batch_walk
### Title: Walk data through batches
### Aliases: gar_batch_walk

### ** Examples


## Not run: 
##D                                
##D 
##D # get a webproperty per account 
##D getAccountInfo <- gar_api_generator(
##D   "https://www.googleapis.com/analytics/v3/management/accounts",
##D   "GET", data_parse_function = function(x) unique(x$items$id))
##D 
##D getWebpropertyInfo <- gar_api_generator(
##D   "https://www.googleapis.com/analytics/v3/management/", # don't use sprintf to construct this
##D   "GET",
##D   path_args = list(accounts = "default", webproperties = ""),
##D   data_parse_function = function(x) x$items)
##D 
##D walkData <- function(){
##D 
##D   # here due to R lazy evaluation  
##D   accs <- getAccountInfo()
##D   gar_batch_walk(getWebpropertyInfo, 
##D                  walk_vector = accs,
##D                  gar_paths = list("webproperties" = ""),
##D                  path_walk = "accounts",
##D                  batch_size = 100, data_frame_output = FALSE)
##D                  }
##D                  
##D # do the walk
##D walkData()
##D 
## End(Not run)






