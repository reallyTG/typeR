library(glmpath)


### Name: plot.bootpath
### Title: Generates the histograms or the pairwise scatter plots of the
###   bootstrap coefficients computed from bootstrap.path
### Aliases: plot.bootpath
### Keywords: models regression

### ** Examples

data(heart.data)
attach(heart.data)
bootstrap.a <- bootstrap.path(x, y, B=5)
plot(bootstrap.a)
plot(bootstrap.a, type="pairplot")
detach(heart.data)



