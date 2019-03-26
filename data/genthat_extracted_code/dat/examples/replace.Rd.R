library(dat)


### Name: replace
### Title: Replace elements in a vector
### Aliases: replace replace,ANY,function-method replace,ANY,formula-method
###   replace,ANY,character-method

### ** Examples

replace(c(1, 2, NA), is.na, 0)
replace(c(1, 2, NA), rep(TRUE, 3), 0)
replace(c(1, 2, NA), 3, 0)
replace(list(x = 1, y = 2), "x", 0)
replace(list(x = 1, y = 2), "^x$", 0)
replace(list(x = 1, y = "a"), is.character, NULL)



