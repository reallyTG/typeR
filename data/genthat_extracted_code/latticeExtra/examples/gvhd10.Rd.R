library(latticeExtra)


### Name: gvhd10
### Title: Flow cytometry data from five samples from a patient
### Aliases: gvhd10
### Keywords: datasets

### ** Examples

## Figure 3.4 from Sarkar (2008)
data(gvhd10)
histogram(~log2(FSC.H) | Days, gvhd10, xlab = "log Forward Scatter",
          type = "density", nint = 50, layout = c(2, 4))



