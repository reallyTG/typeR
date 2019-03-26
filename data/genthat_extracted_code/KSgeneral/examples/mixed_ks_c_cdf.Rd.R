library(KSgeneral)


### Name: mixed_ks_c_cdf
### Title: Computes the complementary cumulative distribution function of
###   the two-sided Kolmogorov-Smirnov statistic when the cdf under the
###   null hypothesis is mixed
### Aliases: mixed_ks_c_cdf

### ** Examples

# Compute the complementary cdf of D_{n}
# when the underlying distribution is a mixed distribution
# with two jumps at 0 and log(2.5),
# as in Example 3.1 of Dimitrova, Kaishev, Tan (2017)

## Defining the mixed distribution

Mixed_cdf_example <- function(x)
{
     result <- 0
     if (x < 0){
         result <- 0
     }
     else if (x == 0){
         result <- 0.5
     }
     else if (x < log(2.5)){
         result <- 1 - 0.5 * exp(-x)
     }
     else{
         result <- 1
     }

     return (result)
 }

KSgeneral::mixed_ks_c_cdf(0.1, 25, c(0, log(2.5)), Mixed_cdf_example)


## Not run: 
##D ## Compute P(D_{n} >= q) for n = 5,
##D ## q = 1/5000, 2/5000, ..., 5000/5000
##D ## when the underlying distribution is a mixed distribution
##D ## with four jumps at 0, 0.2, 0.8, 1.0,
##D ## as in Example 2.8 of Dimitrova, Kaishev, Tan (2017)
##D 
##D n <- 5
##D q <- 1:5000/5000
##D 
##D Mixed_cdf_example <- function(x)
##D {
##D   result <- 0
##D   if (x < 0){
##D     result <- 0
##D   }
##D   else if (x == 0){
##D     result <- 0.2
##D   }
##D   else if (x < 0.2){
##D     result <- 0.2 + x
##D   }
##D   else if (x < 0.8){
##D     result <- 0.5
##D   }
##D   else if (x < 1){
##D     result <- x - 0.1
##D   }
##D   else{
##D     result <- 1
##D   }
##D 
##D   return (result)
##D }
##D 
##D plot(q, sapply(q, function(x) KSgeneral::mixed_ks_c_cdf(x, n,
##D      c(0, 0.2, 0.8, 1.0), Mixed_cdf_example)), type='l')
##D 
## End(Not run)




