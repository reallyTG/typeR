library(BWStest)


### Name: bws_cdf
### Title: CDF of the Baumgartner-Weiss-Schindler test under the null.
### Aliases: bws_cdf

### ** Examples


# do it 500 times
set.seed(123)
bvals <- replicate(500, bws_stat(rnorm(50),rnorm(50)))
pvals <- bws_cdf(bvals)
# these should be uniform!
## Not run: 
##D  
##D   plot(ecdf(pvals)) 
## End(Not run)

# compare to Table 1 of Baumgartner et al.
bvals <- c(1.933,2.493,3.076,3.880,4.500,5.990)
tab1v <- c(0.9,0.95,0.975,0.990,0.995,0.999)
pvals <- bws_cdf(bvals,lower_tail=TRUE)
show(data.frame(B=bvals,BWS_psi=tab1v,our_psi=pvals))




