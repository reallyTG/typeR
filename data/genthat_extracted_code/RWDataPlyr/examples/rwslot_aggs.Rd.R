library(RWDataPlyr)


### Name: rwslot_annual_sum
### Title: Simple aggregation functions for monthly matrix data
### Aliases: rwslot_annual_sum sumMonth2Annual rwslot_annual_min
###   getMinAnnValue rwslot_annual_max getMaxAnnValue rwslot_fwaac

### ** Examples

zz <- rdf_get_slot(keyRdf, 'Powell.Outflow')

# returns in original units, e.g., acre-ft
annualTotVal <- rwslot_annual_sum(zz)

# returns in scaled units, e.g., kaf
annualTotVal <- rwslot_annual_sum(zz, 0.001) 

pe <- rdf_get_slot(keyRdf,'Mead.Pool Elevation')
peMax <- rwslot_annual_min(pe)

pe <- rdf_get_slot(keyRdf,'Mead.Pool Elevation')
peMax <- rwslot_annual_max(pe)

flow <- rdf_get_slot(keyRdf,'Powell.Outflow')
# make up mass, since it's not stored in the example data
rr <- matrix(
  rnorm((nrow(flow) * ncol(flow)), mean = 1000, sd = 200), 
  nrow = nrow(flow), 
  ncol = ncol(flow)
)
mass <- flow / 1000000 * rr^2 - rr + 1500 
fwaac <- rwslot_fwaac(mass, flow) 




