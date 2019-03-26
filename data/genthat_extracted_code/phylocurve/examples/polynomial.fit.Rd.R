library(phylocurve)


### Name: polynomial.fit
### Title: Fit polynomial curves to species data using stepwise regression
### Aliases: polynomial.fit

### ** Examples

x_length <- 50
nspecies <- 25
sim_data <- sim.curves(nspecies = nspecies,x_length = x_length)

# Fit polynomial curves to raw data
poly_data <- polynomial.fit(data = sim_data$data,x_variable = "x",y_variable = "y",min_y = 0)

# Align curve data using dynamic time warping
# NOT RUN (takes several minutes)
# P <- phylocurve.generalized(tree = sim_data$tree,X = poly_data$X,Y = poly_data$Y)



