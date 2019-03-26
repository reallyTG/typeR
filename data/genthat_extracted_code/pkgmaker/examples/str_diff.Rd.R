library(pkgmaker)


### Name: str_diff
### Title: Finding Differences Between Strings
### Aliases: str_diff

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


# strings to compare
x <- "once upon a time"
y <- "once upon a time there was"
z <- "once upon two times"

# diff: x - y
d <- str_diff(x, y)
d
str(d)

# other comparisons 
str_diff(y, x)
str_diff(x, x)
str_diff(x, z)
str_diff(y, z)




