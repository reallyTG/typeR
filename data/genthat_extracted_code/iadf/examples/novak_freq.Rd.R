library(iadf)


### Name: novak_freq
### Title: iadf frequency per cambial age
### Aliases: novak_freq

### ** Examples

data('example_iadf')
model <- novak_weibull(novak_freq(example_iadf), 15)
novak_index(example_iadf, model)



