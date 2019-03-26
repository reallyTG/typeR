library(jwutil)


### Name: strip
### Title: strip all whitespace
### Aliases: strip

### ** Examples

## Not run: 
##D requireNamespace("microbenchmark")
##D requireNamespace("stringr")
##D x <- random_string(25000);
##D microbenchmark::microbenchmark(
##D   gsub(x = x, pattern = "A", replacement = "", fixed = TRUE, useBytes = TRUE),
##D   gsub(x = x, pattern = "A", replacement = "", fixed = TRUE, useBytes = TRUE, perl = TRUE),
##D   gsub(x = x, pattern = "A", replacement = ""),
##D   stringr::str_replace_all(x, "A", "")
##D   )
## End(Not run)



