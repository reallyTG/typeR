library(rtweet)


### Name: do_call_rbind
### Title: Binds list of data frames while preserving attribute (tweets or
###   users) data.
### Aliases: do_call_rbind

### ** Examples


## Not run: 
##D 
##D ## lapply through three different search queries
##D lrt <- lapply(
##D   c("rstats OR tidyverse", "data science", "python"),
##D   search_tweets,
##D   n = 5000
##D )
##D 
##D ## convert list object into single parsed data rame
##D rt <- do_call_rbind(lrt)
##D 
##D ## preview tweets data
##D rt
##D 
##D ## preview users data
##D users_data(rt)
##D 
## End(Not run)




