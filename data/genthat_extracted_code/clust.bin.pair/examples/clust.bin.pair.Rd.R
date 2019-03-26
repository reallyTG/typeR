library(clust.bin.pair)


### Name: clust.bin.pair
### Title: Statistical test for clustered binary matched pair data
### Aliases: clust.bin.pair

### ** Examples


with(psychiatry, clust.bin.pair(ah, bh, ch, dh, method="eliasziw"))

tc <- nested.to.contingency(thyroids$x.pet, thyroids$x.spect)
clust.bin.pair(tc$ak, tc$bk, tc$ck, tc$dk, method="obuchowski")

oc <- with(obfuscation, paired.to.contingency(group = list(subject, atom),
                                              t1 = control, t2 = treatment))
clust.bin.pair(oc$ak, oc$bk, oc$ck, oc$dk, method="durkalski")




