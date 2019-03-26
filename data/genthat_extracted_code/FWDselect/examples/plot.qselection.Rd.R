library(FWDselect)


### Name: plot.qselection
### Title: Visualization of 'qselection' object
### Aliases: plot.qselection

### ** Examples

library(FWDselect)
data(diabetes)
x = diabetes[ ,2:11]
y = diabetes[ ,1]
obj2 = qselection(x, y, qvector = c(1:9), method = "lm", criterion = "variance", cluster = FALSE)
plot(obj2)



