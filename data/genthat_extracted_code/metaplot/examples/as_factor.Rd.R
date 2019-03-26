library(metaplot)


### Name: as_factor
### Title: Coerce to Factor using Encoding if Present
### Aliases: as_factor

### ** Examples

library(magrittr)
foo <- c(1, 2, NA, 4, 5)
as_factor(foo)
as_factor(factor(foo))
as_factor(as.factor(foo))
as_factor(structure(foo, guide = '....'))
as_factor(structure(foo, guide = '//5//'))
as_factor(structure(foo, guide = '//5/bar//'))
as_factor(structure(foo, guide = '//5/bar//6/baz//'))
as_factor(structure(factor(foo), guide = '//5/bar//'))
as_factor(structure(factor(foo), guide = '//5/bar//')) %>% sort
as_factor(structure(factor(foo), guide = '....'))
as_factor(structure(factor(foo), guide = '//1/bar//5/bar//'))





