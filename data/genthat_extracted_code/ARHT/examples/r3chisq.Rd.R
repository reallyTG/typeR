library(ARHT)


### Name: r3chisq
### Title: 3-variate positively correlated chi-squared sample generation
###   when degrees of freedom are large
### Aliases: r3chisq

### ** Examples

set.seed(10086)
cor_examp = matrix(c(1,1/6,2/3,1/6,1,2/3,2/3,2/3,1),3,3)
a_sam = r3chisq(size = 10000,
                df = c(80,90,100),
                corr_mat = cor_examp)
cov(a_sam$sample) - a_sam$approx_cov
cov2cor(a_sam$approx_cov) - cor_examp



