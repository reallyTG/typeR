library(phylolm)


### Name: OU1d.loglik
### Title: Log likelihood of an one-dimensional Ornstein-Uhlenbeck model
### Aliases: OU1d.loglik

### ** Examples

tr = rtree(100)
alpha = 1
sigma2 = 1
sigma2_error = 0.5
ancestral.state = 0
optimal.value = 1
  
trait = rTrait(n = 1, tr, model = "OU", 
              parameters = list(ancestral.state=ancestral.state, alpha=alpha,
                                sigma2=sigma2,sigma2_error=sigma2_error,
                                optimal.value=optimal.value))
OU1d.loglik(trait=trait, phy=tr, model="OUfixedRoot", 
            parameters=list(ancestral.state=ancestral.state, alpha=alpha,sigma2=sigma2,
                            sigma2_error=sigma2_error,optimal.value=optimal.value))



