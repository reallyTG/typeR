library(tables)


### Name: Paste
### Title: Generate terms to paste values together in table.
### Aliases: Paste

### ** Examples

stderr <- function(x) sd(x)/sqrt(length(x))
latex( tabular( (Species+1) ~ Sepal.Length*
          PlusMinus(mean, stderr, digits=1), data=iris ) )



