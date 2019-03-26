library(sppmix)


### Name: GetStats
### Title: Retrieves basic Bayesian estimates from a generated chain
### Aliases: GetStats

### ** Examples

## No test: 
truemix <- normmix(ps=c(.4, .2,.4), mus=list(c(0.3, 0.3), c(.5,.5),c(0.7, 0.7)),
 sigmas = list(.02*diag(2), .05*diag(2), .01*diag(2)))
intsurf=to_int_surf(truemix,lambda = 100, win = spatstat::square(1))
pp1 <- rsppmix(intsurf)
fit <- est_mix_damcmc(pp1, 3)
p1=GetStats(fit$genps[,1])
p1$Mean
p1$CredibleSet
p2=GetStats(fit$genps[,2])
p2$Mean
p2$CredibleSet
p3=GetStats(fit$genps[,3])
p3$Mean
p3$CredibleSet
## End(No test)




