library(ggm)


### Name: fitDagLatent
### Title: Fitting Gaussian DAG models with one latent variable
### Aliases: fitDagLatent
### Keywords: graphs models multivariate

### ** Examples

## data from Joreskog and Goldberger (1975)
V <- matrix(c(1,     0.36,   0.21,  0.10,  0.156, 0.158,
              0.36,  1,      0.265, 0.284, 0.192, 0.324,
              0.210, 0.265,  1,     0.176, 0.136, 0.226,
              0.1,   0.284,  0.176, 1,     0.304, 0.305, 
              0.156, 0.192,  0.136, 0.304, 1,     0.344,
              0.158, 0.324,  0.226, 0.305, 0.344, 1),     6,6)
nod <- c("y1", "y2", "y3", "x1", "x2", "x3")
dimnames(V) <- list(nod,nod)
dag <- DAG(y1 ~ z, y2 ~ z, y3 ~ z, z ~ x1 + x2 + x3, x1~x2+x3, x2~x3) 
fitDagLatent(dag, V, n=530, latent="z", seed=4564)
fitDagLatent(dag, V, n=530, latent="z", norm=2, seed=145)



