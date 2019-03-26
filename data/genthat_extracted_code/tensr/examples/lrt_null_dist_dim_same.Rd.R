library(tensr)


### Name: lrt_null_dist_dim_same
### Title: Draw from null distribution of likelihood ratio test statistic.
### Aliases: lrt_null_dist_dim_same
### Keywords: likelihood

### ** Examples

#Test for all identity versus all unconstrained.
p = c(4,4,4)
null1 <- lrt_null_dist_dim_same(p,null_ident = 1:3)

#Generate Null Data
X <- array(stats::rnorm(prod(p)), dim = p)
sig_null <- holq(X, mode_rep = 1:3)$sig
sig_alt <- holq(X)$sig
lrt_x <- lrt_stat(sig_null, sig_alt, p = p)
p_value <- mean(null1 > lrt_x)

hist(null1,main = 'Null Distribution of LRT', xlab = 'LRT Statistic')
abline(v = lrt_x, lty = 2, col = 2, lwd = 2)
legend('topleft', 'Observed LRT Statistic', lty = 2, col = 2, lwd = 2)
mtext(side = 1, paste('P-value = ', round(p_value, digits = 2), sep = ''),
      line = 2)

#-------------------------------------------------------------------------

#Test for all identity versus all mode 1 identity,
#  mode 2 diagonal, mode 3 unconstrained.
p = c(4,4,4)
null2 <- lrt_null_dist_dim_same(p,null_ident = 1:3,
                                alt_ident = 1, alt_diag = 2)

#Generate Null Data
X <- array(stats::rnorm(prod(p)), dim = p)
sig_null <- holq(X, mode_rep = 1:3)$sig
sig_alt <- holq(X, mode_rep = 1, mode_diag = 2)$sig
lrt_x <- lrt_stat(sig_null, sig_alt, p = p)
p_value <- mean(null2 > lrt_x)

hist(null2,main = 'Null Distribution of LRT', xlab = 'LRT Statistic')
abline(v = lrt_x, lty = 2, col = 2, lwd = 2)
legend('topleft', 'Observed LRT Statistic', lty = 2, col = 2, lwd = 2)
mtext(side = 1, paste('P-value = ', round(p_value, digits = 2), sep = ''),
      line = 2)



