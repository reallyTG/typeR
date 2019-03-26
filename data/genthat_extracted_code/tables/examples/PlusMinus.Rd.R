library(tables)


### Name: PlusMinus
### Title: Generate 'x +/- y' terms in table.
### Aliases: PlusMinus

### ** Examples

stderr <- function(x) sd(x)/sqrt(length(x))
latex( tabular( (Species+1) ~ Sepal.Length*
          PlusMinus(mean, stderr, digits=1), data=iris ) )



