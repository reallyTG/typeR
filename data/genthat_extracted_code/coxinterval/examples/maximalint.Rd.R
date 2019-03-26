library(coxinterval)


### Name: maximalint
### Title: Find maximal intersections from an interval-type survival object
### Aliases: maximalint
### Keywords: survival

### ** Examples

s <- with(cosmesis[1:10, ], Surv(left, right, type = "interval2"))
s
maximalint(s)



