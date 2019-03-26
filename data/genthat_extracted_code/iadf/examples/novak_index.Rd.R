library(iadf)


### Name: novak_index
### Title: novak_index
### Aliases: novak_index

### ** Examples

data('example_iadf')
model <- novak_weibull(novak_freq(example_iadf), 15)
novak_index(example_iadf, model)



