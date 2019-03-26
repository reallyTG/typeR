library(FFTrees)


### Name: plot.FFTrees
### Title: Plots an FFTrees object.
### Aliases: plot.FFTrees

### ** Examples


# Create FFTrees of the heart disease data
heart.fft <- FFTrees(formula = diagnosis ~.,
data = heartdisease)

# Visualise the tree
plot(heart.fft,
     main = "Heart Disease Diagnosis",
     decision.labels = c("Absent", "Present"))


# See the vignette for more details
vignette("FFTrees_plot", package = "FFTrees")






