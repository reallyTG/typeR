library(mmeln)


### Name: post.mmeln,entropy.mmeln
### Title: Posterior probabilities, entropy for mmeln object
### Aliases: post.mmeln post entropy.mmeln entropy
### Keywords: mmeln mixture normal multivariate

### ** Examples

#### load an example.
data(exY)

### estimation of the parameters of the mixture
temps <- factor(1:3)
mmeln1 <- mmeln(Y, G = 2, form.loc = ~temps - 1, form.mel = ~1, cov = "CS")
mix1 <- estim(mmeln1, mu = list(rep(1,3),rep(2,3)), tau = c(0),
              sigma = list(c(1, .4), c(1, .4)), iterlim = 100, tol = 1e-6)
post(mix1)
entropy(mix1)



