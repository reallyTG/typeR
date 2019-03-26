library(npregfast)


### Name: localtest
### Title: Testing the equality of critical points
### Aliases: localtest

### ** Examples

library(npregfast)
data(barnacle)
localtest(DW ~ RC : F, data = barnacle, der = 1, seed = 130853, nboot = 100)

# localtest(height ~ s(age, by = sex), data = children, seed = 130853, 
# der = 1, smooth = "splines") 




