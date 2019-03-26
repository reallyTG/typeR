library(datetimeutils)


### Name: guess_datetime
### Title: Guess Timestamp Format
### Aliases: guess_datetime
### Keywords: chron

### ** Examples

s <- c("  1999-08-19     10:00:31   ",
       "   1999-08-19 10:00",
       "19.8.1999 10:00",
       "8/19/99      10:00:31",
       "8/19/1999 10:00:31",
       "19.8.1999 10:00:31")

guess_datetime(s)

## Not run: 
##D ## the actual rules
##D rules <- as.data.frame(matrix(datetimeutils:::.dt_patterns,
##D                               byrow = TRUE, ncol = 2),
##D                        stringsAsFactors = FALSE)
##D names(rules) <- c("pattern", "assumed_format")
##D rules
##D 
## End(Not run)



