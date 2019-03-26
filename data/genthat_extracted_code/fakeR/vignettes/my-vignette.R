## ---- results='hide'-----------------------------------------------------
library(datasets)
library(fakeR)
library(stats)

## ---- fig.width=6, fig.height=4------------------------------------------
# single column of an unordered, string factor
state_df <- data.frame(division=state.division)
# character variable
state_df$division <- as.character(state_df$division)
# numeric variable
state_df$area <- state.area
# factor variable
state_df$region <- state.region
state_sim <- simulate_dataset(state_df)

## ------------------------------------------------------------------------
head(state_df)
head(state_sim)

## ------------------------------------------------------------------------
df <- mtcars
# change one of the variable types to an unordered factor
df$carb <- as.factor(df$carb)
# change another variable type to an ordered factor
df$gear <- as.ordered(as.factor(df$gear))
df[2,] <- NA
sim_df <- simulate_dataset(df, stealth.level=2, ignore='mpg', use.miss=TRUE)

## ------------------------------------------------------------------------
## time series dataframe
tree_ring <- data.frame(treering)
tree_ring$year <- c(1: nrow(tree_ring))
sim_tree_ring <- simulate_dataset_ts(tree_ring, 
                                     cluster="treering", 
                                     time.variable="year")

## ---- fig.width=6, fig.height=4------------------------------------------
plot (tree_ring$year, tree_ring$treering, type='l', 
      main=paste("Original","Normalized ring width"),
      ylab="Ring width", xlab="Year index")
plot (tree_ring$year, tree_ring$treering, type='l', 
      main=paste("Simulated","Normalized ring width"),
      ylab="Ring width", xlab="Year index")  

