library(mosaicCore)


### Name: formularise
### Title: Convert lazy objects into formulas
### Aliases: formularise

### ** Examples

formularise(lazyeval::lazy(foo))
formularise(lazyeval::lazy(y ~ x))
bar <- a ~ b
formularise(lazyeval::lazy(bar))



