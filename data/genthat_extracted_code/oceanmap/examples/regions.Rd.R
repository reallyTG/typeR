library(oceanmap)


### Name: regions
### Title: Returns two-row summary table of a specified region.
### Aliases: regions

### ** Examples

## Example: return summary table for the Gulf of Lions
data('region_definitions')
region_definitions[region_definitions$label=='lion',] # select raw region data summary 
regions('lion') # return formatted summary table



