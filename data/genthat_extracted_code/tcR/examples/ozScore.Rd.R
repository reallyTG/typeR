library(tcR)


### Name: ozScore
### Title: Overlap Z-score.
### Aliases: ozScore

### ** Examples

## Not run: 
##D data(twb)
##D mat <- repOverlap(twb)
##D ozScore(mat)
##D # Take 3x3 matrix
##D ozScore(mat[1:3, 1:3])
##D # Return as matrix with OZ scores
##D ozmat <- ozScore(mat, T, T, 'oz')
##D # Return as matrix with normalised absolute OZ scores
##D oznorm <- ozScore(mat, T, T, 'norm')
##D # Plot it as boxplots
##D sb <- matrixSubgroups(oznorm, list(tw1 = c('Subj.A', 'Subj.B'), tw2 = c('Subj.C', 'Subj.D')));
##D vis.group.boxplot(sb)
## End(Not run)



