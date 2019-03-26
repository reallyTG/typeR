library(Observation)


### Name: Observation
### Title: Collect and Process Physical Activity Direct Observation Data
### Aliases: Observation Observation-package

### ** Examples


# Example of non-interactive use
data(example_data)
compendium_reference(example_data, FALSE, kids = "yes", mvpa = "yes")

# Example of interactive use
if (interactive()) {
  observation_data <- data_collection_program()
  full_data <- compendium_reference(observation_data)
}




