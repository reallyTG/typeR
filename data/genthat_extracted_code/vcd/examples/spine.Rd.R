library(vcd)


### Name: spine
### Title: Spine Plots and Spinograms
### Aliases: spine spine.default spine.formula
### Keywords: hplot

### ** Examples

## Arthritis data (dependence on a categorical variable)
data("Arthritis")
(spine(Improved ~ Treatment, data = Arthritis))

## Arthritis data (dependence on a numerical variable)
(spine(Improved ~ Age, data = Arthritis, breaks = 5))
(spine(Improved ~ Age, data = Arthritis, breaks = quantile(Arthritis$Age)))
(spine(Improved ~ Age, data = Arthritis, breaks = "Scott"))

## Space shuttle data (dependence on a numerical variable)
data("SpaceShuttle")
(spine(Fail ~ Temperature, data = SpaceShuttle, breaks = 3))



