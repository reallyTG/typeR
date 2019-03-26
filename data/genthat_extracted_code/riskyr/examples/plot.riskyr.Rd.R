library(riskyr)


### Name: plot.riskyr
### Title: Plot information of a riskyr object.
### Aliases: plot.riskyr

### ** Examples

# Select a scenario from list of scenarios:
s25 <- scenarios$n25  # select scenario 25 from scenarios

# Plot different types:
plot(s25)  # => default plot (fnet)
plot(s25, plot.type = "fnet")  # => network diagram (same as default)
plot(s25, plot.type = "tree", area = "vr") # => tree diagram (with vertical rectangles)
plot(s25, plot.type = "curve", what = "all")
plot(s25, plot.type = "icons")
plot(s25, plot.type = "icons", type = "mosaic")  # passing on additional parameter to create.
plot(s25, plot.type = "mosaic")
plot(s25, plot.type = "plane", what = "NPV")





