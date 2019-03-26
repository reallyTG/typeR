library(jmvcore)


### Name: composeTerm
### Title: Compose and decompose interaction terms to and from their
###   components
### Aliases: composeTerm composeTerms decomposeTerm decomposeTerms

### ** Examples

composeTerm(c('a', 'b', 'c'))
# 'a:b:c'

composeTerm(c('a', 'b', 'with space'))
# 'a:b:`with space`'

decomposeTerm('a:b:c')
# c('a', 'b', 'c')

decomposeTerm('a:b:`with space`')
# c('a', 'b', 'with space')




