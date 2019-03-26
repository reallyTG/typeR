library(PointFore)


### Name: summary.pointfore
### Title: Method for object of class pointfore
### Aliases: summary.pointfore

### ** Examples

# estimate.functional generates a pointfore object...
res <- estimate.functional(Y=GDP$observation, X=GDP$forecast,
model=constant,
instruments="const")

# ...which can be summarized with the \code{summary} function.
summary(res)



