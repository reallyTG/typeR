library(qdapRegex)


### Name: rm_nchar_words
### Title: Remove/Replace/Extract N Letter Words
### Aliases: rm_nchar_words ex_nchar_words
### Keywords: words

### ** Examples

x <- "This is Jon's dogs' 'bout there in a word Mike's re'y."
rm_nchar_words(x, 4)
ex_nchar_words(x, 4)

## Count characters (apostrophes and letters)
ex_nchar_words(x, 5, pattern = "@rm_nchar_words2")

## nchar range
rm_nchar_words(x, "1,2")

## Not run: 
##D ## Larger example
##D library(qdap)
##D ex_nchar_words(hamlet[["dialogue"]], 5)
## End(Not run)



