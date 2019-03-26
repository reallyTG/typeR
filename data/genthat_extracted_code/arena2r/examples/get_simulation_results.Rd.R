library(arena2r)


### Name: get_simulation_results
### Title: Get Results from Arena CSV Files
### Aliases: get_simulation_results

### ** Examples

# Define de path where your csv files are:
path <- system.file("extdata", package = "arena2r")
simulation_results = get_simulation_results(path)
head(simulation_results)



