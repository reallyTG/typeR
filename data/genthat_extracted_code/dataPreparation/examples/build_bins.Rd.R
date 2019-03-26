library(dataPreparation)


### Name: build_bins
### Title: Compute bins
### Aliases: build_bins

### ** Examples

# Load data
data(messy_adult)
head(messy_adult)

# Compute bins
bins <- build_bins(messy_adult, cols = "auto", n_bins = 5, type = "equal_freq")
print(bins)



