library(table1)


### Name: render.varlabel
### Title: Render variable labels for table output.
### Aliases: render.varlabel
### Keywords: utilities

### ** Examples

x <- exp(rnorm(100, 1, 1))
label(x) <- "Weight"
units(x) <- "kg"
render.varlabel(x)

y <- factor(sample(0:1, 99, replace=TRUE), labels=c("Female", "Male"))
y[1:10] <- NA
label(y) <- "Sex"
render.varlabel(y)



