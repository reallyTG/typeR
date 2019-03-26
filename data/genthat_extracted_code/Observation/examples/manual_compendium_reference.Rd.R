library(Observation)


### Name: manual_compendium_reference
### Title: Manually Encode Direct Observation Intensities by
###   Cross-Referencing the Compendium of Physical Activities
### Aliases: manual_compendium_reference
### Keywords: internal

### ** Examples

data(example_data)

example_data_processed <- compendium_reference(example_data, FALSE,
   kids = "yes", mvpa = "yes")

if (interactive()) {
 View(example_data_processed$data)
 View(example_data_processed$indeterminate[[1]])
 View(example_data_processed$compendium)
}




