library(clue)


### Name: fit_ultrametric_target
### Title: Fit Dissimilarities to a Hierarchy
### Aliases: ls_fit_ultrametric_target l1_fit_ultrametric_target
### Keywords: cluster optimize

### ** Examples

data("Phonemes")
## Note that the Phonemes data set has the consonant misclassification
## probabilities, i.e., the similarities between the phonemes.
d <- as.dist(1 - Phonemes)
## Find the maximal dominated and miminal dominating ultrametrics by
## hclust() with single and complete linkage:
y1 <- hclust(d, "single")
y2 <- hclust(d, "complete")
## Note that these are quite different:
cl_dissimilarity(y1, y2, "gamma")
## Now find the L2 optimal members of the respective dendrogram
## equivalence classes.
u1 <- ls_fit_ultrametric_target(d, y1)
u2 <- ls_fit_ultrametric_target(d, y2)
## Compute the L2 optimal ultrametric approximation to d.
u <- ls_fit_ultrametric(d)
## And compare ...
cl_dissimilarity(cl_ensemble(Opt = u, Single = u1, Complete = u2), d)
## The solution obtained via complete linkage is quite close:
cl_agreement(u2, u, "cophenetic")



