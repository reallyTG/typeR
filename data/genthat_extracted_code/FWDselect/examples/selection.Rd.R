library(FWDselect)


### Name: selection
### Title: Selecting a subset of 'q' variables
### Aliases: selection

### ** Examples

library(FWDselect)
data(diabetes)
x = diabetes[ ,2:11]
y = diabetes[ ,1]
obj1 = selection(x, y, q = 1, method = "lm", criterion = "variance", cluster = FALSE)
obj1

# second models
obj11 = selection(x, y, q = 1, method = "lm", criterion = "variance",
seconds = TRUE, nmodels = 2, cluster = FALSE)
obj11

# prevar argument
obj2 = selection(x, y, q = 2, method = "lm", criterion = "variance", cluster = FALSE)
obj2
obj3 = selection(x, y, q = 3, prevar = obj2$Variable_numbers,
method = "lm", criterion = "variance", cluster = FALSE)





