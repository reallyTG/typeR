library(REAT)


### Name: krugman.conc
### Title: Krugman coefficient of spatial industry concentration for two
###   industries
### Aliases: krugman.conc

### ** Examples

E_ij <- c(4388, 37489, 129423, 60941)
E_uj <- E_ij/2
krugman.conc(E_ij, E_uj)
# exactly the same structure (= no concentration)



