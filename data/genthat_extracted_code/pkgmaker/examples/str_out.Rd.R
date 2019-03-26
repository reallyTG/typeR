library(pkgmaker)


### Name: str_out
### Title: Formatting Utilities
### Aliases: str_out str_desc str_fun str_class str_pkg str_md5sum str_hash
###   str_bs

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


x <- letters[1:10]
str_out(x)
str_out(x, 8)
str_out(x, Inf)
str_out(x, quote=FALSE)
str_out(x, total = TRUE)

str_fun(install.packages)
str_class(matrix())

# Backspace substitution
str_bs("abc")
str_bs("abc\b")
str_bs("abc\b\b")
str_bs("abc\bd")
str_bs("abc\b\bde\b")

# more complex example
x <- "\bab\nc\bd\n\babc\b\bd"
cat(x, "\n")
y <- str_bs(x)
y
cat(y, "\n")




