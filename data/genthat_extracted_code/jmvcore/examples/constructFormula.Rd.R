library(jmvcore)


### Name: constructFormula
### Title: Construct a formula string
### Aliases: constructFormula

### ** Examples


constructFormula(terms=list('a', 'b', c('a', 'b')))
# a+b+a:b

constructFormula('f', list('a', 'b', c('a', 'b')))
# "f~a+b+a:b"

constructFormula('with spaces', list('a', 'b', c('a', 'b')))
'`with spaces`~a+b+a:b'




