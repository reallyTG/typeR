library(BaMORC)


### Name: calculate_rcf
### Title: Calculates the relative cumulative frequency for amino acid and
###   secondary structure.
### Aliases: calculate_rcf

### ** Examples

sequence = paste(RefDB_data$carbonDat[[1]]$AA, collapse = "")
secondary_structure = paste(RefDB_data$carbonDat[[1]]$SS, collapse = "")
relativeCumulativeFrequency = calculate_rcf(sequence, secondary_structure)



