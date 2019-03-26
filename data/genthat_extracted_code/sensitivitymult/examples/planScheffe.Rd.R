library(sensitivitymult)


### Name: planScheffe
### Title: Combining One Planned Comparison and a Scheffe Correction For
###   All Comparisons.
### Aliases: planScheffe
### Keywords: htest robust

### ** Examples

# Please READ the documentation for artcog, and in particular
# the distinction between simulated and actual data.
# The dontrun section refers to the acutal data and
# reproduces results in Rosenbaum (2017).

planScheffe(2,alpha=0.05)
# Interpretation of this output follows.
# Suppose there is a bivariate Normal outcome.  We specify
# one a priori linear combination of its two coordinates.
# We test that the expectation is (0,0) with known covariance
# matrix.  We compute the standardized difference for the
# a priori contrast, rejecting if it is >=1.895.  We also
# reject if we can find any linear combination of the two
# coordinates whose squared standardized difference is
# >=7.077.  The chance that we falsely reject a true
# null hypothesis is 0.05.  The chance of a false rejection
# using the a priori comparison is 0.029.  The chance of
# false rejection using any linear combination is 0.029.
#
# The a priori comparison could be the first principal
# component.  Using the principal() function with
# w=c(1,0) gives the deviate for the first principal
# component.  Exploring every w=c(w1,w2) gives the
# deviates that are squared for comparison with 7.077.

## Not run: 
##D # For this illustration, obtain the actual data,
##D # as described in the documentation for artcog.
##D # An illustration from Rosenbaum (2017) follows.
##D data(artcog)
##D attach(artcog)
##D # The comparison using the first principal component:
##D principal(cbind(words,wordsdelay,animals),arthritis,mset,
##D      w=c(1,0),gamma=1.396,detail=TRUE)
##D # The resulting deviate, 1.900 is slightly greated than 1.895,
##D # so the hypothesis of no effect would be rejected at 0.05 even if
##D # we allow for a bias in treatment assignment of gamma=1.396.
##D principal(cbind(words,wordsdelay,animals),arthritis,mset,
##D      w=c(1,-.075),gamma=1.396,detail=TRUE)
##D # The comparison w=c(1,-.075) yields a slightly larger
##D # deviate, 1.907, but 1.907^2 < 7.077, so this ad hoc
##D # comparison would not lead to rejection.
##D detach(artcog)
##D # Interpret gamma:
##D amplify(1.396,c(2,3))
##D amplify(1.4,c(2,3))
##D   
## End(Not run)



