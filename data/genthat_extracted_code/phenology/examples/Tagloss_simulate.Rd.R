library(phenology)


### Name: Tagloss_simulate
### Title: Return a list with the number of days different kinds of
###   individuals are seen.
### Aliases: Tagloss_simulate

### ** Examples

library(phenology)
## Not run: 
##D # Example
##D par <- structure(c(49.5658922243074, 808.136085362158, 106.283783786853, 
##D 5.22150592456511, 8.00608716525864, 8.32718202233396, 150.612916258503, 
##D 715.865805125223, 2242.06574225966, 119.212383120678, 10.1860735529433, 
##D 7.14231725937626), .Names = c("D1_2", "D2D1_2", "D3D2_2", "A_2", 
##D "B_2", "C_2", "D1_1", "D2D1_1", "D3D2_1", "A_1", "B_1", "C_1"))
##D cmr <- Tagloss_simulate(n=500, 
##D                         par=par, model="12")
##D cmr_f <- Tagloss_format(cmr, model="12")
## End(Not run)



