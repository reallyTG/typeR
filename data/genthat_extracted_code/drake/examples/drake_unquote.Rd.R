library(drake)


### Name: drake_unquote
### Title: Remove leading and trailing escaped quotes from character
###   strings.
### Aliases: drake_unquote

### ** Examples

x <- "'abcd'"
# Remove the literal quotes around x.
drake_unquote(x) # "abcd"



