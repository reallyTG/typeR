library(fuzzySim)


### Name: transpose
### Title: Transpose (part of) a matrix or dataframe
### Aliases: transpose
### Keywords: manip

### ** Examples

data(rotif.env)

head(rotif.env)

names(rotif.env)

rotif.reg <- transpose(rotif.env, sp.cols = 18:47, reg.names = 1)

head(rotif.reg)



