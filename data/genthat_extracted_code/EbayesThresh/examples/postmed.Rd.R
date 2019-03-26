library(EbayesThresh)


### Name: postmed
### Title: Posterior median estimator
### Aliases: postmed postmed.laplace postmed.cauchy cauchy.medzero
### Keywords: nonparametric

### ** Examples

postmed(c(-2,1,0,-4,8,50), w = 0.05, prior = "cauchy")
postmed(c(-2,1,0,-4,8,50), s = 1:6, w = 0.2, prior = "laplace", a = 0.3)



