library(textclean)


### Name: which_are
### Title: Detect/Locate Potential Non-Normalized Text
### Aliases: which_are is_it

### ** Examples

wa <- which_are()
it <- is_it()
wa$digit(c('The dog',  "I like 2", NA))
it$digit(c('The dog',  "I like 2", NA))

is_it()$list_column(c('the dog', 'ate the chicken'))




