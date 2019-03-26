library(edstan)


### Name: labelled_integer
### Title: Transform a vector into consecutive integers
### Aliases: labelled_integer

### ** Examples

x <- c("owl", "cat", "pony", "cat")
labelled_integer(x)

y <- as.factor(x)
labelled_integer(y)

z <- rep(c(22, 57, 13), times = 2)
labelled_integer(z)



