library(FWDselect)


### Name: print.selection
### Title: Short 'selection' summary
### Aliases: print.selection

### ** Examples

library(FWDselect)
data(diabetes)
x = diabetes[ ,2:11]
y = diabetes[ ,1]
obj1 = selection(x, y, q = 1, method = "lm", criterion = "variance", cluster = FALSE)
obj1



