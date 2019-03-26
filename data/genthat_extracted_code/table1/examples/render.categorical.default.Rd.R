library(table1)


### Name: render.categorical.default
### Title: Render categorical values for table output.
### Aliases: render.categorical.default
### Keywords: utilities

### ** Examples

y <- factor(sample(0:1, 99, replace=TRUE), labels=c("Female", "Male"))
y[1:10] <- NA
render.categorical.default(y)



