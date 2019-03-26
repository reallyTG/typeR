library(CommEcol)


### Name: dis.chao
### Title: Chao et al. dissimilarity indices
### Aliases: dis.chao

### ** Examples

library(vegan)
### Example 1: Rare species are heavier:
aa <- c(1, 2, 4, 5)
bb <- c(1, 2, 0, 5)
cc <- c(0, 2, 3, 3)
dat3 <- rbind(aa, bb, cc) 
colnames(dat3) <- c("sp1", "sp2", "sp3", "sp4")
dat3

vegdist(dat3, method='jaccard', binary=FALSE) 
# Notice dissimilarity between the pair aa-bb is the same of the pair aa-cc. 
# In fact, bb and cc differ from aa in the same way (one species, and 
# 4 exclusive individuals).

dis.chao(dat3, index="jaccard", version="prob") 
# The probability version of the Chao index, however, produce different 
# dissimilarities for the pairs aa-bb and aa-cc 
# (aa-cc is less dissimilar than aa-bb).

dis.chao(dat3, index="jaccard", version="rare")
# The dissimilarity for the pair aa-cc is the same as that obtained using the 
# probability version. However, the dissimilarity for the pair aa-bb decreased.
# The reason is that aa-bb shares two rare species (sp1, sp2), 
# whereas the pair aa-cc shares a single rare species (sp2). 


### Example 2: "rare" version of the Chao index simplifies to the 
# "probability" version if no rare species (with 1 or 2 individuals) is present.
data(japi)
dim(japi) # 75 sampling units (stones) and 66 morphospecies of 
          # stream macroinvertebrates.
japi.m <- as.matrix(japi)
japi.2 <- ifelse(japi.m==1, 3, japi.m) # no singletons.
japi.3 <- ifelse(japi.2==2, 3, japi.2) # no doubletons.

sort(
     dis.chao(japi.3, index='jac', version='rare')  
   - dis.chao(japi.3, index='jac', version='prob'))


### Example 3: frequency data
# Stones in the japi dataset were sampled from downstream to upstream direction.
# Consecutive stones are spaced 1-6 m. The set of the first 25 stones should be
# more dissimilar to the last set of 25 stones than the middle set 
# (simply because of spatial autocorrelation).
japi.pa <- ifelse(japi.m > 0, 1, 0) # presence-absence data
japi.1st <- japi.pa[ 1:25, ]
japi.2nd <- japi.pa[26:50, ]
japi.3rd <- japi.pa[51:75, ]

japi.inc <- rbind(
                 colSums(japi.1st),
                 colSums(japi.2nd),
                 colSums(japi.3rd)
) # species frequency of occurrence in the three sets of stones.

dis.chao(japi.inc, index="jaccard", freq=c(25, 25, 25) )



