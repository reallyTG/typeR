library(table1)


### Name: render.default
### Title: Render values for table output.
### Aliases: render.default
### Keywords: utilities

### ** Examples

x <- exp(rnorm(100, 1, 1))
render.default(x)
render.default(x, TRUE)

y <- factor(sample(0:1, 99, replace=TRUE), labels=c("Female", "Male"))
y[1:10] <- NA
render.default(y)




