library(dispRity)


### Name: chrono.subsets
### Title: Separating data in chronological subsets.
### Aliases: chrono.subsets time.series time.subsets

### ** Examples

## Load the Beck & Lee 2014 data
data(BeckLee_tree) ; data(BeckLee_mat50)
data(BeckLee_mat99) ; data(BeckLee_ages)

## Time binning (discrete method)
## Generate two discrete time bins from 120 to 40 Ma every 40 Ma
chrono.subsets(data = BeckLee_mat50, tree = BeckLee_tree, method = "discrete",
     time = c(120, 80, 40), inc.nodes = FALSE, FADLAD = BeckLee_ages)
## Generate the same time bins but including nodes
chrono.subsets(data = BeckLee_mat99, tree = BeckLee_tree, method = "discrete",
     time = c(120, 80, 40), inc.nodes = TRUE, FADLAD = BeckLee_ages)

## Time slicing (continuous method)
## Generate five equidistant time slices in the dataset assuming a proximity
## evolutionary model
chrono.subsets(data = BeckLee_mat99, tree = BeckLee_tree,
     method = "continuous", model = "acctran", time = 5,
     FADLAD = BeckLee_ages)




