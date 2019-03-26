library(dataPreparation)


### Name: fastDiscretization
### Title: Discretization
### Aliases: fastDiscretization

### ** Examples

# Load data
data(messy_adult)
head(messy_adult)

# Compute bins
bins <- build_bins(messy_adult, cols = "auto", n_bins = 5, type = "equal_freq")

# Discretize
messy_adult <- fastDiscretization(messy_adult, bins = bins)

# Control
head(messy_adult)

# Example with hand written bins
data("adult")
adult <-  fastDiscretization(adult, bins = list(age = c(0, 40, +Inf)))
print(table(adult$age))



