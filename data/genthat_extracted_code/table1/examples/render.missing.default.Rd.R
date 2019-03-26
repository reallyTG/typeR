library(table1)


### Name: render.missing.default
### Title: Render missing values for table output.
### Aliases: render.missing.default
### Keywords: utilities

### ** Examples

y <- factor(sample(0:1, 99, replace=TRUE), labels=c("Female", "Male"))
y[1:10] <- NA
render.missing.default(y)



