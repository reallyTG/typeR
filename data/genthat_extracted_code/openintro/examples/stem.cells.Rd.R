library(openintro)


### Name: stem.cells
### Title: Stem Cell Transplant Experiment
### Aliases: stem.cells
### Keywords: datasets

### ** Examples

data(stem.cells)
change <- stem.cells$after - stem.cells$before
summary(lm(change ~ trmt, stem.cells))



