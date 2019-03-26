library(fakeR)


### Name: fakeR-package
### Title: Simulates Data from a Data Frame of Different Variable Types
### Aliases: fakeR-package fakeR
### Keywords: package

### ** Examples

## time-independent data frame of multiple types
# single column of an unordered, string factor
state_df <- data.frame(division=state.division)
# character variable
state_df$division <- as.character(state_df$division)
# numeric variable
state_df$area <- state.area
# factor variable
state_df$region <- state.region
state_sim <- simulate_dataset(state_df)

## time-independent data frame with missingness
df <- mtcars
# change one of the variable types to an unordered factor
df$carb <- as.factor(df$carb)
# change another variable type to an ordered factor
df$gear <- as.ordered(as.factor(df$gear))
df[2,] <- NA
sim_df <- simulate_dataset(df, stealth.level=2)

## time series dataframe
tree_ring <- data.frame(treering)
tree_ring$year <- c(1: nrow(tree_ring))
sim_tree_ring <- simulate_dataset_ts(tree_ring, 
                                     cluster="treering", 
                                     time.variable="year")
par(mfrow = c(2, 1), mar = c(3, 3, 4, 2), mgp = 0.9 * 2:0)
plot (tree_ring$year, tree_ring$treering, type='l', 
      main=paste("Original","Normalized ring width"),
      ylab="Ring width", xlab="Year index")
plot (tree_ring$year, tree_ring$treering, type='l', 
      main=paste("Simulated","Normalized ring width"),
      ylab="Ring width", xlab="Year index")  



