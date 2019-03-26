library(surveillance)


### Name: makeControl
### Title: Generate 'control' Settings for an 'hhh4' Model
### Aliases: makeControl

### ** Examples

makeControl()

## a simplistic model for the fluBYBW data
## (first-order transmission only, no district-specific intercepts)
data("fluBYBW")
mycontrol <- makeControl(
    f = list(~1, ~1, ~t), S = c(1, 1, 3),
    offset = list(population(fluBYBW)),  # recycled -> in all components
    ne = list(normalize = TRUE), verbose = TRUE)
str(mycontrol)
## Not run: fit <- hhh4(fluBYBW, mycontrol)



