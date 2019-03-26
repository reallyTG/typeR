library(HIest)


### Name: gcline.fn
### Title: Fit a genomic cline using maximum likelihood
### Aliases: gcline.fn
### Keywords: ~kwd1 ~kwd2

### ** Examples

x <- 0:50/50          # hypothetical genomic ancestry proportions
y <- rbinom(50,2,x)   # random diploid genotypes for a diagnostic marker
n=rep(2,50)			  # sample size is two alleles per diploid individual

gcline.fn(x=x,n=n,y=y,start=c(.5,2),model="logit-logit")




