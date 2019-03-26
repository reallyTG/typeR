library(KSgeneral)


### Name: mixed_ks_test
### Title: Computes the p-value for a one-sample two-sided
###   Kolmogorov-Smirnov test when the cdf under the null hypothesis is
###   mixed
### Aliases: mixed_ks_test

### ** Examples

# Example to compute the p-value of the one-sample two-sided KS test,
# when the underlying distribution is a mixed distribution
# with two jumps at 0 and log(2.5),
# as in Example 3.1 of Dimitrova, Kaishev, Tan (2017)

# Defining the mixed distribution

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
test_data <- c(0,0,0,0,0,0,0.1,0.2,0.3,0.4,
            0.5,0.6,0.7,0.8,log(2.5),log(2.5),
            log(2.5),log(2.5),log(2.5),log(2.5))
KSgeneral::mixed_ks_test(test_data, c(0, log(2.5)),
                         Mixed_cdf_example)


## Compute the p-value of a two-sided K-S test
## when F(x) follows a zero-and-one-inflated
## beta distribution, as in Example 3.3
## of Dimitrova, Kaishev, Tan (2017)

## The data set is the proportion of inhabitants
## living within a 200 kilometer wide costal strip
## in 232 countries in the year 2010

data("Population_Data")
mu <- 0.6189
phi <- 0.6615
a <- mu * phi
b <- (1 - mu) * phi

Mixed_cdf_example <- function(x)
{
     result <- 0
     if (x < 0){
         result <- 0
     }
     else if (x == 0){
         result <- 0.1141
     }
     else if (x < 1){
         result <- 0.1141 + 0.4795 * pbeta(x, a, b)
     }
     else{
         result <- 1
     }

     return (result)
}
KSgeneral::mixed_ks_test(Population_Data, c(0, 1), Mixed_cdf_example)





