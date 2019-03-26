library(ade4)


### Name: rtest.between
### Title: Monte-Carlo Test on the between-groups inertia percentage (in
###   R).
### Aliases: rtest.between
### Keywords: multivariate nonparametric

### ** Examples

data(meaudret)
pca1 <- dudi.pca(meaudret$env, scan = FALSE, nf = 3)
rand1 <- rtest(bca(pca1, meaudret$design$season, scan = FALSE), 99)
rand1
plot(rand1, main = "Monte-Carlo test")



