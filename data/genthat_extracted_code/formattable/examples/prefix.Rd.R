library(formattable)


### Name: prefix
### Title: Formattable object with prefix
### Aliases: prefix

### ** Examples

prefix(1:10, "A")
prefix(1:10, "Choice", sep = " ")
prefix(c(1:10, NA), prefix = "A", na.text = "(missing)")
prefix(rnorm(10, 10), "*", format = "d")
prefix(percent(c(0.1,0.25)), ">")



