library(jmvcore)


### Name: stringifyTerm
### Title: Converts a term into a string
### Aliases: stringifyTerm

### ** Examples

stringifyTerm(c('a', 'b', 'c'))

# "a:b:c"

stringifyTerm(c('a', 'b', 'c'), sep=' * ')

# "a * b * c"

options('jmvTermSep', ' * ')
stringifyTerm(c('a', 'b', 'c'))

# "a * b * c"

#' stringifyTerm(c('`quoted`', 'b', 'c'))

# "quoted * b * c"




