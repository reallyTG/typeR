library(EFAutilities)


### Name: efaMR
### Title: Exploratory Factor Analysis with Multiple Rotations
### Aliases: efaMR
### Keywords: exploratory factor analysis factor rotation factor loadings

### ** Examples

#data("CPAI537")    # Chinese personality assessment inventory (N = 537)

# # Example 1: Oblique geomin rotation with 10 random starts
# res1 <- efaMR(CPAI537, factors = 5, fm = 'ml', 
#               rtype = 'oblique', rotation = 'geomin',
#               geomin.delta = .01, nstart = 10)
# res1
# summary(res1)
# res1$MultipleSolutions
# res1$Comparisons

# In practice, we recommend nstart = 100 or more (Hattori, Zhang, & Preacher, 2018).   


# Example 2: Oblique geomin rotation (no random starts)
#            compared against CF-varimax and CF-quartimax rotation solutions
# res2 <- efaMR(CPAI537, factors = 5, fm = 'ml', 
#               rtype = 'oblique', rotation = 'geomin',
#               additionalRC = c('CF-varimax', 'CF-quartimax'), 
#               geomin.delta = .01, nstart = 1)
# res2$MultipleSolutions
# res2$Comparisons


# Example 3: Obtaining multiple solutions from the unrotated factor loading matrix as input
# res3 <- efa(CPAI537, factors = 5, fm = 'ml', 
#             rtype = 'oblique', rotation = 'geomin')
# set.seed(2017)
# res3MR <- efaMR(input.A = res3$unrotated, rtype = 'oblique',
#                 rotation = 'geomin', geomin.delta = .01)
# res3MR$MultipleSolutions
# res3MR$Comparisons



