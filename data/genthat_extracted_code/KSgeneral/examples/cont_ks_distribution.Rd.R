library(KSgeneral)


### Name: cont_ks_cdf
### Title: Computes the cumulative distribution function of the two-sided
###   Kolmogorov-Smirnov statistic when the cdf under the null hypothesis
###   is continuous
### Aliases: cont_ks_cdf

### ** Examples

## Compute the value for P(D_{100} <= 0.05)

KSgeneral::cont_ks_cdf(0.05, 100)


## Compute P(D_{n} <= q)
## for n = 100, q = 1/500, 2/500, ..., 500/500
## and then plot the corresponding values against q

n<-100
q<-1:500/500
plot(q, sapply(q, function(x) KSgeneral::cont_ks_cdf(x, n)), type='l')

## Compute P(D_{n} <= q) for n = 40, nq^{2} = 0.76 as shown
## in Table 9 of Dimitrova, Kaishev, Tan (2017)

KSgeneral::cont_ks_cdf(sqrt(0.76/40), 40)




