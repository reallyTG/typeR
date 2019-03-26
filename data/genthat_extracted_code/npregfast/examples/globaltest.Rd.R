library(npregfast)


### Name: globaltest
### Title: Testing the equality of the _M_ curves specific to each level
### Aliases: globaltest

### ** Examples

library(npregfast)
data(barnacle)
globaltest(DW ~ RC : F, data = barnacle, der = 1, seed = 130853, nboot = 100)

# globaltest(height ~ s(age, by = sex), data = children, 
# seed = 130853, der = 0, smooth = "splines")





