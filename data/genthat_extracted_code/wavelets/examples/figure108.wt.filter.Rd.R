library(wavelets)


### Name: figure108.wt.filter
### Title: Plot Multiple DWT Wavelet or Scaling Filters
### Aliases: figure108.wt.filter
### Keywords: ts

### ** Examples

# Plotting the LA8 Wavelet Filter
filter <- wt.filter()
figure108.wt.filter(filter)

# Alternatively
figure108.wt.filter("la8")

# Plotting the Haar, D4, D6 Wavelet Filters
figure108.wt.filter(list("haar", "d4", "d6"))

# Plotting the Haar, D4, D6 Scaling Filters
figure108.wt.filter(list("haar", "d4", "d6"), wavelet = FALSE)

# Alternatively
haar <- wt.filter("haar")
d6 <- wt.filter("d6")
figure108.wt.filter(list(haar, "d4", d6), wavelet = FALSE)

# Adding an "made up" filter (represented by c(1,-1,1,-1)
figure108.wt.filter(list(haar, "d4", d6, c(1,-1,1,-1)), wavelet = FALSE)



