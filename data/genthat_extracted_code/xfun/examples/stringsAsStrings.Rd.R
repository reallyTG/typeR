library(xfun)


### Name: stringsAsStrings
### Title: Set the global option 'options(stringsAsFactors = FALSE)' inside
###   a parent function and restore the option after the parent function
###   exits
### Aliases: stringsAsStrings strings_please

### ** Examples

f = function() {
    xfun::strings_please()
    data.frame(x = letters[1:4], y = factor(letters[1:4]))
}
str(f())  # the first column should be character



