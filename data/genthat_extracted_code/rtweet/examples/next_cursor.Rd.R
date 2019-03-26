library(rtweet)


### Name: next_cursor
### Title: next_cursor/previous_cursor/max_id
### Aliases: next_cursor max_id previous_cursor since_id

### ** Examples

## Not run: 
##D 
##D ## Retrieve user ids of accounts following POTUS
##D f1 <- get_followers("potus", n = 75000)
##D 
##D ## store next_cursor in page
##D page <- next_cursor(f1)
##D 
##D ## max. number of ids returned by one token is 75,000 every 15
##D ##   minutes, so you'll need to wait a bit before collecting the
##D ##   next batch of ids
##D sys.Sleep(15 * 60) ## Suspend execution of R expressions for 15 mins
##D 
##D ## Use the page value returned from \code{next_cursor} to continue
##D ##   where you left off.
##D f2 <- get_followers("potus", n = 75000, page = page)
##D 
##D ## combine
##D f <- do.call("rbind", list(f1, f2))
##D 
##D ## count rows
##D nrow(f)
##D 
## End(Not run)




