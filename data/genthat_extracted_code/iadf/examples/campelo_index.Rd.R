library(iadf)


### Name: campelo_index
### Title: campelo_index
### Aliases: campelo_index

### ** Examples

data('example_iadf')
data('example_rwl')
model <- campelo_chapman(campelo_freq(example_iadf, example_rwl))
campelo_index(example_iadf, example_rwl, model)



