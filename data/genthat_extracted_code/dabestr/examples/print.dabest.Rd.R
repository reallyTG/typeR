library(dabestr)


### Name: print.dabest
### Title: Print a 'dabest' object
### Aliases: print.dabest

### ** Examples

# Performing unpaired (two independent groups) analysis.
unpaired_mean_diff <- dabest(iris, Species, Petal.Width,
                             idx = c("setosa", "versicolor"),
                             paired = FALSE)

# Display the results in a user-friendly format.
print(unpaired_mean_diff)




