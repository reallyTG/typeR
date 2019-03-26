library(pgdraw)


### Name: pgdraw
### Title: Generate random samples from the Polya-Gamma distribution,
###   PG(b,c)
### Aliases: pgdraw

### ** Examples

# -----------------------------------------------------------------
# Example 1: Simulated vs exact moments
u = matrix(1,1e6,1)
x = pgdraw(1,0.5*u)
mean(x)
var(x)
pgdraw.moments(1,0.5)

x = pgdraw(2,2*u)
mean(x)
var(x)
pgdraw.moments(2,2)


# -----------------------------------------------------------------
# Example 2: Simple logistic regression
#   Sample from the following Bayesian hierarchy:
#    y_i ~ Be(1/(1+exp(-b)))
#    b   ~ uniform on R (improper)
#
#   which is equivalent to
#    y_i - 1/2 ~ N(b, 1/omega2_i)
#    omega2_i  ~ PG(1,0)
#    b         ~ uniform on R
#
sample_simple_logreg <- function(y, nsamples)
{
  n = length(y)
  omega2 = matrix(1,n,1)   # Polya-Gamma latent variables
  beta   = matrix(0,nsamples,1)
  
  for (i in 1:nsamples)
  {
    # Sample 'beta'
    s = sum(omega2)
    m = sum(y-1/2)/s
    beta[i] = rnorm(1, m, sqrt(1/s))
    # Sample P-G L.Vs
    omega2 = pgdraw(1, matrix(1,n,1)*beta[i])
  }
  return(beta)
}

# 3 heads, 7 tails; ML estimate of p = 3/10 = 0.3
y = c(1,1,1,0,0,0,0,0,0,0)  

# Sample
b = sample_simple_logreg(y, 1e4)
hist(x=b)

# one way of estimating of 'p' from posterior samples
1/(1+exp(-mean(b)))         





