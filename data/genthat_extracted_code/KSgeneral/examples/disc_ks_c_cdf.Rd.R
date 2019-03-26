library(KSgeneral)


### Name: disc_ks_c_cdf
### Title: Computes the complementary cumulative distribution function of
###   the two-sided Komogorov-Smirnov statistic when the cdf under the null
###   hypothesis is purely discrete
### Aliases: disc_ks_c_cdf

### ** Examples

## Example to compute the exact complementary cdf for D_{n}
## when the underlying cdf F(x) is a binomial(3, 0.5) distribution,
## as shown in Example 3.4 of Dimitrova, Kaishev, Tan (2017)

binom_3 <- stepfun(c(0:3), c(0,pbinom(0:3,3,0.5)))
KSgeneral::disc_ks_c_cdf(0.05, 400, binom_3)

## Not run: 
##D ## Compute P(D_{n} >= q) for n = 100,
##D ## q = 1/5000, 2/5000, ..., 5000/5000, when
##D ## the underlying cdf F(x) is a binomial(3, 0.5) distribution,
##D ## as shown in Example 3.4 of Dimitrova, Kaishev, Tan (2017),
##D ## and then plot the corresponding values against q,
##D ## i.e. plot the resulting complementary cdf of D_{n}
##D 
##D n <- 100
##D q <- 1:5000/5000
##D binom_3 <- stepfun(c(0:3), c(0,pbinom(0:3,3,0.5)))
##D plot(q, sapply(q, function(x) KSgeneral::disc_ks_c_cdf(x, n, binom_3)), type='l')
## End(Not run)

## Not run: 
##D ## Example to compute the asymptotic complementary cdf for D_{n}
##D ## based on Wood and Altavela (1978),
##D ## when the underlying cdf F(x) is a binomial(3, 0.5) distribution,
##D ## as shown in Example 3.4 of Dimitrova, Kaishev, Tan (2017)
##D 
##D binom_3 <- stepfun(c(0: 3), c(0, pbinom(0 : 3, 3, 0.5)))
##D KSgeneral::disc_ks_c_cdf(0.05, 400, binom_3, exact = FALSE, tol = 1e-08,
##D sim.size = 1e+06, num.sim = 10)
## End(Not run)




