library(iadf)


### Name: campelo_freq
### Title: iadf frequency per ring width class
### Aliases: campelo_freq

### ** Examples

data('example_iadf')
data('example_rwl')
model <- campelo_chapman(campelo_freq(example_iadf, example_rwl))
campelo_index(example_iadf, example_rwl, model)



