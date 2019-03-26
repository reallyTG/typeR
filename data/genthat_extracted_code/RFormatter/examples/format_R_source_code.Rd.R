library(RFormatter)


### Name: format_R_source_code
### Title: Formats R source code.
### Aliases: format_R_source_code

### ** Examples


format_R_source_code("if (b) { f() }")
format_R_source_code("if (b) { f()\n\nf() }")
format_R_source_code("p = 2", list(arrow = TRUE, width.cutoff = 80))
format_R_source_code("(k/n)^x", spaced_operators = c("/"))

## Not run: 
##D format_R_source_code("f()", text = NULL)
##D format_R_source_code("f()", output = TRUE)
## End(Not run)




