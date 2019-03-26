library(qdap)


### Name: replace_ordinal
### Title: Replace Mixed Ordinal Numbers With Text Representation
### Aliases: replace_ordinal
### Keywords: ordinal-to-word

### ** Examples

## Not run: 
##D x <- c(
##D     "I like the 1st one not the 22nd one.", 
##D     "For the 100th time stop!"
##D )
##D replace_ordinal(x)
##D replace_ordinal(x, FALSE)
##D replace_ordinal(x, remove = TRUE)
##D "I like the 1st 1 not the 22nd 1." %>% replace_ordinal %>% replace_number
## End(Not run)



