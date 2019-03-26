library(BayLum)


### Name: plot_Scatterplots
### Title: Display Scatter Plot Matrix of the Bayesian Age Results
### Aliases: plot_Scatterplots ScatterSamples

### ** Examples

data(AgeS,envir = environment())

##hexbin
plot_Scatterplots(
   object = AgeS$Sampling,
   sample_names = c("GDB5", "GDB3"),
   sample_selection = c(1,2)
 )

##scatter smooth (matrix)
plot_Scatterplots(
   object = AgeS$Sampling,
   sample_names = c("GDB5", "GDB3"),
   sample_selection = c(1,2),
   plot_type = "smoothScatter")


##scatter smooth (single)
plot_Scatterplots(
   object = AgeS$Sampling,
   sample_names = c("GDB5", "GDB3"),
   sample_selection = c(1,2),
   plot_type = "smoothScatter",
   plot_mode = "single")




