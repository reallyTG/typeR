library(BaMORC)


### Name: bamorc
### Title: Calculates the referencing correction value.
### Aliases: bamorc

### ** Examples

sequence <- paste(RefDB_data$carbonDat[[1]]$AA,collapse = "")
secondary_structure <- paste(RefDB_data$carbonDat[[1]]$SS,collapse = "")
chemical_shifts_input <- RefDB_data$carbonDat[[1]][,c(4,5)]
from=-5
to=5

## Not run: bamorc(sequence, secondary_structure, chemical_shifts_input, from=-5, to=5)

# Expected output
# [1] 0.0142443


sequence <- paste(BaMORC::RefDB_data$carbonDat[[1]]$AA,collapse = "")
chemical_shifts_input <- BaMORC::RefDB_data$carbonDat[[1]][,c(4,5)]
from=-5
to=5


## Not run: bamorc(sequence=sequence, chemical_shifts_input=chemical_shifts_input, from=-5, to=5)
# Expected output
# [1] 0.009805279



