library(mistr)


### Name: breakpoints
### Title: Extract Model Breakpoints
### Aliases: breakpoints breakpoints.compdist breakpoints.trans_compdist
###   breakpoints.comp_fit

### ** Examples

N <- normdist(1, 3)
C <- cauchydist()

CC <- compdist(N, C, weights = c(0.5, 0.5), breakpoints = 1)
breakpoints(CC)



