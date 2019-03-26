library(lestat)


### Name: contrast
### Title: Computing the distribution of a Contrast
### Aliases: contrast contrast.default contrast.mnormalexpgamma
###   contrast.mnormalgamma
### Keywords: Contrast

### ** Examples

data1 <- simulate(normal(13, log(0.4)), 3)
data2 <- simulate(normal(14, log(0.4)), 5)
data3 <- simulate(normal(12, log(0.4)), 6)
dist <- linearmodel(c(data1, data2, data3), designManyGroups(c(3,5,6)))
diff <- contrast(dist, c(0, 1, -1))
credibilityinterval(marginal(diff, 1))



