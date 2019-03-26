library(RInSp)


### Name: overlap
### Title: Mean pairwise overlap
### Aliases: overlap
### Keywords: function utilities

### ** Examples

 data(Stickleback)
# Select a single spatial sampling site (site D)
GutContents_SiteD = import.RInSp(Stickleback, row.names = 1,
info.cols = c(2:13), subset.rows = c("Site", "D"))
similarity = overlap(GutContents_SiteD)

## Not run: 
##D # Generate a plot similar to Bolnick and Paull 2009, testing whether
##D # morphological differences between individuals are positively related
##D # to diet differences (or conversely are negatively related to diet similarity)
##D GutContents = import.RInSp(Stickleback, row.names = 1,info.cols = c(2:13))
##D similarity = overlap(GutContents)
##D diet.similarity = as.dist(similarity$overlapmatrix)
##D size.dissimilarity = dist(GutContents$info[,3])
##D plot(diet.similarity ~ size.dissimilarity, xlab = "Size dissimilarity",
##D ylab = "Diet similarity", pch = 16, cex = 0.4)
##D model = lm(diet.similarity ~ size.dissimilarity)
##D abline(model, lwd = 3, col = "red")
##D 
##D # The ade4 package is needed to complete the analysis
##D library(ade4)
##D mantel.rtest(diet.similarity, size.dissimilarity)
## End(Not run)



