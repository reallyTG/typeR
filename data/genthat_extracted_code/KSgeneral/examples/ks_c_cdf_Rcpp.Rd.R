library(KSgeneral)


### Name: ks_c_cdf_Rcpp
### Title: R function calling directly the C++ routines that compute the
###   complementary cumulative distribution function of the two-sided (or
###   one-sided, as a special case) Kolmogorov-Smirnov statistic, when the
###   cdf under the null hypothesis is arbitrary (i.e., purely discrete,
###   mixed or continuous)
### Aliases: ks_c_cdf_Rcpp

### ** Examples


## Computing the complementary cdf P(D_{n} >= q)
## for n = 10 and q = 0.1, when F(x) is continuous,
## In this case,
## B_i = (i-1)/n + q
## A_i =  i/n - q


n <- 10
q <- 0.1
up_rec <- ((1:n)-1)/n + q
low_rec <- (1:n)/n - q
df <- data.frame(rbind(up_rec, low_rec))
write.table(df,"Boundary_Crossing_Time.txt", sep = ", ",
                  row.names = FALSE, col.names = FALSE)
ks_c_cdf_Rcpp(n)




