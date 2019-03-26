library(hedgehog)


### Name: gen.structure
### Title: Generate a structure
### Aliases: gen.structure

### ** Examples

# To create a matrix
gen.structure( gen.c(of = 6, gen.element(1:30)), dim = 3:2)

# To create a data frame for testing.
gen.structure (
  list ( gen.c(of = 4, gen.element(2:10))
       , gen.c(of = 4, gen.element(2:10))
       , c('a', 'b', 'c', 'd')
       )
  , names = c('a','b', 'constant')
  , class = 'data.frame'
  , row.names = c('1', '2', '3', '4' ))



