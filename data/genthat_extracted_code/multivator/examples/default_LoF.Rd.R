library(multivator)


### Name: default_LoF
### Title: Default List of functions
### Aliases: default_LoF

### ** Examples

data(mtoys)

default_LoF(toy_mm)  # note list names == levels(toy_mm)

regressor(toy_mm)           # use default
regressor(toy_mm , toy_LoF) # use a bespoke set



