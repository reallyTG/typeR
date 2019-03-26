library(rappdirs)


### Name: user_cache_dir
### Title: Return full path to the user-specific cache dir for this
###   application.
### Aliases: user_cache_dir

### ** Examples

user_cache_dir("rappdirs")
## Not run: 
##D # Throw this in your R profile to store a R history file in standard cache location
##D if(capabilities("cledit")) {
##D   cache_dir <- rappdirs::user_cache_dir("R")
##D   history_file <- file.path(cache_dir, "Rhistory")
##D   .First <- function() utils::loadhistory(history_file)
##D   .Last <- function() { 
##D     if (!file.exists(cache_dir)) dir.create(cache_dir, recursive = TRUE)
##D     try(savehistory(history_file))
##D   }
##D }
## End(Not run)



