library(Luminescence)


### Name: analyse_portableOSL
### Title: Analyse portable CW-OSL measurements
### Aliases: analyse_portableOSL
### Keywords: datagen plot

### ** Examples


# (1) load example data set
data("ExampleData.portableOSL", envir = environment())

# (2) merge and plot all RLum.Analysis objects
merged <- merge_RLum(ExampleData.portableOSL)
plot_RLum(merged, combine = TRUE)
merged

# (3) analyse and plot
results <- analyse_portableOSL(merged, signal.integral = 1:5, invert = FALSE, normalise = TRUE)
get_RLum(results)






