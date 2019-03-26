## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----running-the-arena2r-app, eval = FALSE-------------------------------
#  
#  runArenaApp()
#  

## ----arena2r-example, eval = FALSE---------------------------------------
#  # Load the library:
#  
#  library(arena2r)
#  
#  # Define the path to your folder with Arena csv files. In my case, it's here:
#  
#  my_path = system.file("extdata", package = "arena2r")
#  
#  # Then, get a tidy results data.frame out of your files!
#  results = arena2r::get_simulation_results(my_path)
#  

## ------------------------------------------------------------------------

library(arena2r)

# Load the example dataset:
data("arena_results")

# Let's call it results
results = arena_results

knitr::kable(head(results))


## ----arena2r-confidence-interval-plot------------------------------------

# Plot a Statistic confidence interval across scenarios for a response variable.

arena2r::plot_confint(sim_results = results, response_variable = "Entity 1.NumberOut")


## ----arena2r-scatter-plot------------------------------------------------

# Now let's plot analyse the relationship between two variables:

arena2r::plot_scatter(sim_results = results, x_variable = "Entity 1.NumberIn", y_variable = "Entity 1.NumberOut")


## ---- warning=FALSE------------------------------------------------------

statistics_summary = arena2r::get_statistics_summary(sim_results = results, confidence = 0.95)

knitr::kable(head(statistics_summary[,1:6]))



