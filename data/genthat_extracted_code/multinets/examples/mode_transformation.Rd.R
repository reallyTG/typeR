library(multinets)


### Name: mode_transformation
### Title: 2-mode to 1-mode transformation
### Aliases: mode_transformation

### ** Examples

# First, extract the mesolevel of the multilevel network
affiliation <- extract_mesolevel(linked_sim)

# To obtain both transformed networks
transformed <- mode_transformation(affiliation)

# To obtain just one transformed network
high_transformed <- mode_transformation(affiliation, which = "high")





