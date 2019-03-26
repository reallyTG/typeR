library(textclean)


### Name: replace_names
### Title: Replace First/Last Names
### Aliases: replace_names

### ** Examples

x <- c(
    "Mary Smith is not here",
    "Karen is not a nice person",
    "Will will do it",
    NA
) 

replace_names(x)
replace_names(x, replacement = '<<NAME>>')



