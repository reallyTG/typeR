library(neurobase)


### Name: zscore_img
### Title: Get Z-score over a margin of an img
### Aliases: zscore_img

### ** Examples

dim = c(100, 30, 5)
img = array(rnorm(prod(dim), mean=4, sd=4), 
dim=dim)

truth2 = img
for (i in 1:dim(img)[2]) {
truth2[,i,] = (truth2[,i,]- mean(truth2[,i,]))/sd(truth2[,i,])
}

truth1 = img
for (i in 1:dim(img)[1]) {
truth1[i,,] = (truth1[i,,]- mean(truth1[i,,]))/sd(truth1[i,,])
}

truth3 = img
for (i in 1:dim(img)[3]) {
truth3[,,i] = (truth3[,,i]- mean(truth3[,,i]))/sd(truth3[,,i])
}
try3 = zscore_img(img, margin=3)
stopifnot(all.equal(try3, truth3))
try2 = zscore_img(img, margin=2)
stopifnot(all.equal(try2, truth2))
try1 = zscore_img(img, margin=1)
stopifnot(all.equal(try1, truth1))
  
z = zscore_img(img, margin=NULL)
ztrim = zscore_img(img, margin=NULL, 
centrality = "trimmed_mean", variability = "trimmed_sd")





