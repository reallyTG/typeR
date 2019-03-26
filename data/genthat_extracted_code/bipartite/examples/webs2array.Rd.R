library(bipartite)


### Name: webs2array
### Title: Puts two or more webs into one array of webs
### Aliases: webs2array
### Keywords: package

### ** Examples

data(Safariland, vazquenc, vazquec)
allin1 <- webs2array(Safariland, vazquenc, vazquec)

# now we can compute distance between two webs:
vegdist(t(cbind(as.vector(allin1[,,1]), as.vector(allin1[,,2]), as.vector(allin1[,,3]))), 
  method="jacc")



