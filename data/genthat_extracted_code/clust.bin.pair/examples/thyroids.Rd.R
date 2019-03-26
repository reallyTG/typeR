library(clust.bin.pair)


### Name: thyroids
### Title: PET and SPECT data for diagnosing hyperparathyroidism
### Aliases: thyroids
### Keywords: datasets

### ** Examples

data(thyroids)

thyroids$n.glands == sapply(thyroids$x.pet, length)
thyroids$n.glands == sapply(thyroids$x.spect, length)

thyroids$n.pet   == sapply(thyroids$x.pet,   function(x) length(which(x == 1)))
thyroids$n.spect == sapply(thyroids$x.spect, function(x) length(which(x == 1)))

tc <- nested.to.contingency(thyroids$x.pet, thyroids$x.spect)

clust.bin.pair(tc[,'ak'], tc[,'bk'], tc[,'ck'], tc[,'dk'], method="obuchowski")

do.call(clust.bin.pair, data.frame(tc))



