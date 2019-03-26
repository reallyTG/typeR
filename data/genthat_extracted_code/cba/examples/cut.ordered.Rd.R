library(cba)


### Name: cut.ordered
### Title: Converting Ordered Factors
### Aliases: cut.ordered
### Keywords: manip

### ** Examples

x <- ordered(sample(letters[1:3],10,rep=TRUE))
cut(x, c(FALSE,TRUE,FALSE))
cut(x, "b")
cut(x, 2)



