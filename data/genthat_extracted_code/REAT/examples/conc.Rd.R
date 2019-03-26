library(REAT)


### Name: conc
### Title: Measures of industry concentration
### Aliases: conc

### ** Examples

data(G.regions.industries)

conc_i <- conc (e_ij = G.regions.industries$emp_all, 
industry.id = G.regions.industries$ind_code,
region.id = G.regions.industries$region_code)



