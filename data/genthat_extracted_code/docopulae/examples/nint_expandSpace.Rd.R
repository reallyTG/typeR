library(docopulae)


### Name: nint_expandSpace
### Title: Expand Space
### Aliases: nint_expandSpace

### ** Examples

s = nint_space(list(nint_intvDim(1, 2),
                    nint_intvDim(3, 4)),
               list(nint_intvDim(-Inf, 0),
                    nint_gridDim(c(0)),
                    nint_intvDim(0, Inf))
               )
s
nint_expandSpace(s)



