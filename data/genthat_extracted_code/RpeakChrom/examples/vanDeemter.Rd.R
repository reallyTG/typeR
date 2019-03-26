library(RpeakChrom)


### Name: vanDeemter
### Title: Characterization of chromatographic columns using vanDeemter
###   equations.
### Aliases: vanDeemter

### ** Examples

ggmetoxi <- vanDeemter(col = parameters_col_metoxi, ext = parameters_ext,
              dead = parameters_dead, length = 150, A = 6, B = 200, C = 0.04,
              GG = TRUE, Foley = FALSE, do.plot = TRUE)

foleymetoxi <- vanDeemter(col = parameters_col_metoxi, ext = parameters_ext,
              dead = parameters_dead, length = 150, A = 6, B = 200, C = 0.04,
              GG = FALSE, Foley = TRUE, do.plot = TRUE)



