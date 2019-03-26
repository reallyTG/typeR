library(ade4)


### Name: randtest.between
### Title: Monte-Carlo Test on the between-groups inertia percentage (in
###   C).
### Aliases: randtest.between
### Keywords: multivariate nonparametric

### ** Examples

data(meaudret)
pca1 <- dudi.pca(meaudret$env, scan = FALSE, nf = 3)
rand1 <- randtest(bca(pca1, meaudret$design$season, scan = FALSE), 99)
rand1
plot(rand1, main = "Monte-Carlo test")



