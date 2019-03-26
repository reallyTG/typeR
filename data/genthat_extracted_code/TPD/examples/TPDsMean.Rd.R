library(TPD)


### Name: TPDsMean
### Title: Creating TPDs without individual observations
### Aliases: TPDsMean

### ** Examples


# 1.  Compute the TPDs of three different species (1 dimension)
sp_ex <- unique(iris$Species)
mt1 <- tapply(iris[, "Sepal.Length"], iris$Species, mean)
means_ex <- matrix(c(mt1), ncol=1)
st1 <- tapply(iris[, "Sepal.Length"], iris$Species, sd)
sds_ex <- matrix(c(st1), ncol=1)
TPDs_iris<- TPDsMean(species = sp_ex, means = means_ex, sds = sds_ex)

# 2.  Compute the TPDs of three different species (2 dimensions)
sp_ex <- unique(iris$Species)
mt1 <- tapply(iris[, "Sepal.Length"], iris$Species, mean)
mt2 <- tapply(iris[, "Sepal.Width"], iris$Species, mean)
means_ex <- matrix(c(mt1, mt2), ncol=2)
st1 <- tapply(iris[, "Sepal.Length"], iris$Species, sd)
st2 <- tapply(iris[, "Sepal.Width"], iris$Species, sd)
sds_ex <- matrix(c(st1, st2), ncol=2)
TPDs_iris<- TPDsMean(species = sp_ex, means = means_ex, sds = sds_ex)

# 3.  Two different populations of each species
samples_aux <- rep(c(rep(1, 25), rep(2, 25)), 3)
sp_ex <- rep(unique(iris$Species), each=2)
mt1 <- tapply(iris[, "Sepal.Length"], (paste0(iris$Species,samples_aux)), mean)
mt2 <- tapply(iris[, "Sepal.Width"], (paste0(iris$Species,samples_aux)), mean)
means_ex <- matrix(c(mt1, mt2), ncol=2)
st1 <- tapply(iris[, "Sepal.Length"], (paste0(iris$Species,samples_aux)), sd)
st2 <- tapply(iris[, "Sepal.Width"], (paste0(iris$Species,samples_aux)), sd)
sds_ex <- matrix(c(st1, st2), ncol=2)
samples_ex<- rep(c("Comm.1","Comm.2"),3)
TPDs_iris_pop <- TPDsMean (species = sp_ex, means = means_ex, sds = sds_ex,
   samples = samples_ex)




