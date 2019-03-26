library(fence)


### Name: nonadaptivefence
### Title: Nonadaptive Fence model selection
### Aliases: nonadaptivefence

### ** Examples

## Not run: 
##D require(fence)
##D 
##D #### Example 1 #####
##D data(iris)
##D full = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + (1|Species)
##D test_naf = fence.lmer(full, iris, fence = "nonadaptive", cn = 12)
##D test_naf$sel_model
## End(Not run)



