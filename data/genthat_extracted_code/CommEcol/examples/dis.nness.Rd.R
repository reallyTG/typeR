library(CommEcol)


### Name: dis.nness
### Title: NNESS and NESS dissimilarity indices
### Aliases: dis.nness dis.nness.find.m

### ** Examples

library(vegan)
aa <- c(1, 2, 4, 5)
bb <- c(1, 2, 0, 5)
cc <- c(0, 2, 3, 3)
dat3 <- rbind(aa, bb, cc) 
colnames(dat3) <- c("sp1", "sp2", "sp3", "sp4")
dat3

#  NESS using m=1 is the same as Morisita and
# NNESS using m=1 is the same as Morisita-Horn:
dis.nness(dat3, m=1, ness=TRUE)
vegdist(dat3, method="morisita")

dis.nness(dat3, m=1, ness=FALSE)
vegdist(dat3, method="horn")

# The dissimilarity for the pair aa-bb is reduced if more weight is given to 
# rare species (higher m). The reason is that aa-bb shares two rare 
# species (sp1, sp2), whereas the pair aa-cc shares a single rare species (sp2). 
dis.nness(dat3, m=1, ness=FALSE)
dis.nness(dat3, m=8, ness=FALSE)



