library(fakeR)


### Name: simulate_dataset
### Title: Simulate from a data frame of time-independent data.
### Aliases: simulate_dataset
### Keywords: manip datagen

### ** Examples

# single column of an unordered, string factor
state_df <- data.frame(division=state.division)
# character variable
state_df$division <- as.character(state_df$division)
# numeric variable
state_df$area <- state.area
# factor variable
state_df$region <- state.region
state_sim <- simulate_dataset(state_df)



