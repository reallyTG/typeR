library(REAT)


### Name: spec
### Title: Measures of regional specialization
### Aliases: spec

### ** Examples

data(G.regions.industries)

spec_j <- spec (e_ij = G.regions.industries$emp_all, 
industry.id = G.regions.industries$ind_code,
region.id = G.regions.industries$region_code)



