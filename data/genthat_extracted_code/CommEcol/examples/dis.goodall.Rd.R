library(CommEcol)


### Name: dis.goodall
### Title: Goodall dissimilarity index
### Aliases: dis.goodall

### ** Examples

library(vegan)
a <- c(1, 1, 0)
b <- c(2, 1, 0)
c <- c(0, 1, 1)
d <- c(0, 1, 2)
e <- c(0, 1, 3)
dat5 <- rbind(a,b,c,d,e)
colnames(dat5) <- c("sp1","sp2","sp3")
dat5

# Notice the samples in the pair a-b differ from each other exactly in the same
# way as samples in the pair c-d. However, a-b shares a rare species (sp1), 
# whereas c-d shares a frequent species (sp3, which is also present in e). Thus,
# the dissimilarity a-b is the same of c-d using Bray-Curtis, but not using 
# Goodall index:
vegdist(dat5, "bray")
dis.goodall(dat5)

# As the importance of a species for the Goodall index depends on its overall
# frequency in the community data, the deletion of a sample changes results:
dis.goodall(dat5[-5,])



