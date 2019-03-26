library(permuco)


### Name: clusterlm
### Title: Cluster test for longitudinal data
### Aliases: clusterlm

### ** Examples


## Cluster-mass for repeated measures ANOVA
## Warning : np argument must be greater (recommendation: np>=5000)
electrod_O1 <- clusterlm(attentionshifting_signal ~ visibility*emotion*direction
         + Error(id/(visibility*emotion*direction)), data = attentionshifting_design,
         np = 50)

## Results
plot(electrod_O1)

## Tables of clusters
electrod_O1

## Not run: 
##D ## Change the function of the aggregation
##D 
##D ## Sum of squares of F statistics
##D electrod_O1_sum <- clusterlm(attentionshifting_signal ~ visibility*emotion*direction
##D          + Error(id/(visibility*emotion*direction)), data = attentionshifting_design,
##D          aggr_FUN = function(x)sum(x^2))
##D 
##D ## Length of the cluster
##D electrod_O1_length <- clusterlm(attentionshifting_signal ~ visibility*emotion*direction
##D          + Error(id/(visibility*emotion*direction)), data = attentionshifting_design,
##D          aggr_FUN = function(x)length(x))
##D 
##D 
##D ## All multiple comparisons procedures for repeated measures ANOVA
##D ## Permutation method "Rde_kheradPajouh_renaud"
##D full_electrod_O1 <- clusterlm(attentionshifting_signal ~ visibility*emotion*direction
##D           + Error(id/(visibility*emotion*direction)), data = attentionshifting_design,
##D           method = "Rde_kheradPajouh_renaud", multcomp = c("troendle", "tfce",
##D           "clustermass", "bonferroni", "holm", "benjaminin_hochberg"))
## End(Not run)




