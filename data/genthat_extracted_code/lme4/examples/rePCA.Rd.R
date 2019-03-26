library(lme4)


### Name: rePCA
### Title: PCA of random-effects covariance matrix
### Aliases: rePCA

### ** Examples

  fm1 <- lmer(Reaction~Days+(Days|Subject), sleepstudy)
  rePCA(fm1)



