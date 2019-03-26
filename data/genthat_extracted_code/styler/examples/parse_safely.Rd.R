library(styler)


### Name: parse_safely
### Title: Save parsing from text
### Aliases: parse_safely
### Keywords: internal

### ** Examples

## Not run: 
##D styler:::parse_safely("a + 3 -4 -> x\r\n glück + 1")
##D # This cannot be detected as a EOL style problem because the first
##D # line ends as expected with \n
##D styler:::parse_safely("a + 3 -4 -> x\nx + 2\r\n glück + 1")
## End(Not run)
styler:::parse_safely("a + 3 -4 -> \n glück + 1")



