library(Observation)


### Name: interactive_compendium_reference
### Title: Interactively Consult the Compendium of Physical Activities to
###   Encode Direct Observation Intensities
### Aliases: interactive_compendium_reference
### Keywords: internal

### ** Examples


if (interactive()) {
data(example_data)
compendium_reference(example_data)

observation_data <- data_collection_program()
compendium_reference(observation_data)
}



