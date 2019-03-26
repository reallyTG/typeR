library(jmvcore)


### Name: composeFormula
### Title: Compose a formula string
### Aliases: composeFormula

### ** Examples


composeFormula(list('a', 'b', c('a', 'b')))
# ~a+b+a:b

composeFormula('f', list('a', 'b', c('a', 'b')))
# "f~a+b+a:b"

composeFormula('with spaces', list('a', 'b', c('a', 'b')))
'`with spaces`~a+b+a:b'




