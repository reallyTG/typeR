library(polypoly)


### Name: poly_plot
### Title: Plot a polynomial matrix
### Aliases: poly_plot poly_plot_data

### ** Examples

# Defaults to plotting using the row number as x-axis
m <- poly(1:100, degree = 3)
poly_plot(m)

# Not good because observations were not sorted
m2 <- poly(rnorm(100), degree = 3)
poly_plot(m2)

# Instead set by_observation to FALSE to plot along the degree 1 values
poly_plot(m2, by_observation = FALSE)

# Get a dataframe instead of plot
poly_plot_data(m2, by_observation = FALSE)



