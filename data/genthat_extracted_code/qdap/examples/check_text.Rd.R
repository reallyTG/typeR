library(qdap)


### Name: check_text
### Title: Check Text For Potential Problems
### Aliases: check_text
### Keywords: check spelling text

### ** Examples

## Not run: 
##D x <- c("i like", "i want. thet them .", "I am ! that|", "", NA, 
##D     "they,were there", ".", "   ", "?", "3;", "I like goud eggs!", 
##D     "i 4like...", "\\tgreat",  "She said \"yes\"")
##D check_text(x)
##D print(check_text(x), include.text=FALSE)
##D 
##D y <- c("A valid sentence.", "yet another!")
##D check_text(y)
## End(Not run)



