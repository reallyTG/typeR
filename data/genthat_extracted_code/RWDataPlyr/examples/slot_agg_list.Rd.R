library(RWDataPlyr)


### Name: slot_agg_list
### Title: A class to control how RiverWare data are aggregated
### Aliases: slot_agg_list

### ** Examples

# read in a csv file that contains the data
slot_agg_list(
  system.file('extdata','SlotAggTable.csv',package = 'RWDataPlyr')
)

# or specify as a matrix
slot_agg_matrix <- matrix(
  c("KeySlots.rdf", "Powell.Outflow", "AnnualSum", ".001", "powellAnnRel", 
  "KeySlots.rdf", "Mead.Pool Elevatoin", "AnnMinLTE", "1050", "meadLt1050"), 
  nrow = 2, 
  byrow = TRUE
)
slot_agg_list(slot_agg_matrix)




