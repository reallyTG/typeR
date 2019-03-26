library(assertive.strings)


### Name: strip_invalid_chars
### Title: Removes invalid characters from a string.
### Aliases: strip_invalid_chars strip_non_alphanumeric strip_non_numeric

### ** Examples

## Not run: 
##D strip_invalid_chars(
##D   "  We're floating\tin    space\n\n\n", "[[:space:]]", "whitespace"
##D )
##D strip_non_numeric(" +44 800-123-456 ", allow_plus = TRUE)
##D #Inputs such as factors as coerced to character.
##D strip_non_alphanumeric(factor(c(" A1\t1AA.", "*(B2^2BB)%")))
## End(Not run)



