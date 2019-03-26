library(phylocurve)


### Name: GP.fit
### Title: Fit Gaussian process curves to species data
### Aliases: GP.fit

### ** Examples

x_length <- 50
nspecies <- 25
sim_data <- sim.curves(nspecies = nspecies,x_length = x_length)

# Fit nonlinear curves to raw data
# NOT RUN (takes several minutes)
#curve_data <- GP.fit(data = sim_data$data,x_variable = "x",y_variable = "y",min_y = 0)

# Align curve data using dynamic time warping
# P <- phylocurve.generalized(tree = sim_data$tree,X = curve_data$X,Y = curve_data$Y)



