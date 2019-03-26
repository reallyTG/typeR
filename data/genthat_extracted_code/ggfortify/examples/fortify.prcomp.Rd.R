library(ggfortify)


### Name: fortify.prcomp
### Title: Convert 'stats::prcomp', 'stats::princomp' to 'data.frame'
### Aliases: fortify.prcomp fortify.princomp

### ** Examples

fortify(stats::prcomp(iris[-5]))
fortify(stats::prcomp(iris[-5]), data = iris)

fortify(stats::princomp(iris[-5]))
fortify(stats::princomp(iris[-5]), data = iris)



