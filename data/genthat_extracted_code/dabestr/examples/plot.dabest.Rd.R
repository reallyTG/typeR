library(dabestr)


### Name: plot.dabest
### Title: Estimation Plot
### Aliases: plot.dabest

### ** Examples

# Performing unpaired (two independent groups) analysis.
unpaired_mean_diff <- dabest(iris, Species, Petal.Width,
                             idx = c("setosa", "versicolor"),
                             paired = FALSE)

# Create a Gardner-Altman estimation plot.
plot(unpaired_mean_diff)



# Comparing versicolor and virginica petal width to setosa petal width.
shared_control_data <- dabest(iris, Species, Petal.Width,
                              idx = c("setosa", "versicolor", "virginica")
                              )

# Create a Cumming estimation plot.
plot(shared_control_data)




