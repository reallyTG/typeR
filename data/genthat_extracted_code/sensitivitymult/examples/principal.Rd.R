library(sensitivitymult)


### Name: principal
### Title: Sensitivity Analysis for Principal Components of M-Scores for
###   Several Outcomes in an Observational Study.
### Aliases: principal
### Keywords: htest robust

### ** Examples

# Please READ the documentation for artcog, and in particular
# the distinction between simulated and actual data.
# The dontrun section refers to the acutal data and
# reproduces results in Rosenbaum (2017).
# The example immediately below uses the simulated data,
# and is simply a numerical illustration.

data(artcog)
attach(artcog)

# Randomization test using the first principal component of the simulated data.
principal(cbind(words,wordsdelay,animals),arthritis,mset,w=1,apriori=TRUE,detail=TRUE)

# Randomization test exploring a contrast of the first two principal components.
principal(cbind(words,wordsdelay,animals),arthritis,mset,w=c(1,-.1),Scheffe=TRUE)

# Sensitivity analysis using the first principal component of the simulated data.
principal(cbind(words,wordsdelay,animals),arthritis,mset,w=1,gamma=1.2,apriori=TRUE)
amplify(1.2,c(1.5,2))

## Not run: 
##D # For this illustration, obtain the actual data,
##D # as described in the documentation for artcog.
##D # An illustration from Rosenbaum (2017) follows.
##D data(artcog)
##D attach(artcog)
##D # A randomization test using the first principal component for the three memory scores.
##D # The loadings show that the first component gives positive weight to each memory score.
##D principal(cbind(words,wordsdelay,animals),arthritis,mset,w=1,apriori=TRUE,detail=TRUE)
##D #
##D # The comparison above is insensitive to a bias of gamma=1.45
##D principal(cbind(words,wordsdelay,animals),arthritis,mset,w=1,gamma=1.45,apriori=TRUE,detail=TRUE)
##D #
##D # gamma=1.45 is an unobserved covariate that more than triples the odd of a poor memory score
##D # and more than doubles the odds of arthritis.
##D amplify(1.45,c(2,3,4))
##D #
##D # Although the first principal component is insensitive to a bias of gamma=1.45, each
##D # of the three individual variables is sensitive to a bias of gamma=1.45
##D senm(words,arthritis,mset,gamma=1.45)
##D senm(wordsdelay,arthritis,mset,gamma=1.45)
##D senm(animals,arthritis,mset,gamma=1.45)
##D #
##D # Although not particularly useful or enlightening in this one example, we can
##D # explore all weighted combinations of the first two principle components,
##D # correcting for multiple testing using Scheffe projections for dimension 2.
##D # This would be more interesting in an example with 50 outcomes, where we
##D # might want to reduce the dimensionality to 2 or 3 from 50, rather than to 1.
##D # We will do calculations for gamma=1.25.  A gamma=1.25 is an unobserved
##D # covariate that doubles the odds of arthritis and doubles
##D # the odds of a worse memory score.
##D amplify(1.25,2)
##D # The deviate is the same but the corrected P-value is different if w=1 or w=c(1,0),
##D # because the former is doing a single one-sided test, while the latter is anticipating
##D # consideration of all possible combinations of the first two components.
##D principal(cbind(words,wordsdelay,animals),arthritis,mset,w=1,gamma=1.25,apriori=TRUE,detail=TRUE)
##D principal(cbind(words,wordsdelay,animals),arthritis,mset,w=c(1,0),gamma=1.25,Scheffe =TRUE)
##D # A weighted combination of the first two principal components, w=c(1,-.1), is ever so
##D # slightly less sensitive than using the first component alone.
##D principal(cbind(words,wordsdelay,animals),arthritis,mset,w=c(1,-.1),gamma=1.25,Scheffe =TRUE)
##D detach(artcog)
##D   
## End(Not run)



