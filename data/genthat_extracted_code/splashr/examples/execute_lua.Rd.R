library(splashr)


### Name: execute_lua
### Title: Execute a custom rendering script and return a result.
### Aliases: execute_lua

### ** Examples

## Not run: 
##D splash_local %>%
##D   execute_lua('
##D function main(splash)
##D   splash:go("https://projects.fivethirtyeight.com/congress-trump-score/")
##D   splash:wait(0.5)
##D   return splash:evaljs("memberScores")
##D end
##D ') -> res
##D 
##D rawToChar(res) %>%
##D   jsonlite::fromJSON(flatten=TRUE) %>%
##D   purrr::map(tibble::as_tibble) -> member_scores
##D 
##D member_scores
## End(Not run)



