library(twosamples)


### Name: permutation_test_builder
### Title: Permutation Test Builder
### Aliases: permutation_test_builder

### ** Examples

mean_stat = function(a,b,p) abs(mean(a)-mean(b))**p
myfun = permutation_test_builder(mean_stat,2.0)
vec1 = rnorm(20)
vec2 = rnorm(20,4)
myfun(vec1,vec2)



