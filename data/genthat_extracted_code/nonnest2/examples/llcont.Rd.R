library(nonnest2)


### Name: llcont
### Title: Individual Log-Likelihoods
### Aliases: llcont

### ** Examples

## Fit gamma glm, check that sum of llcont() equals
## the model loglikelihood:
clotting <- data.frame(u = c(5,10,15,20,30,40,60,80,100),
                       lot1 = c(118,58,42,35,27,25,21,19,18),
                       lot2 = c(69,35,26,21,18,16,13,12,12))
gam1 <- glm(lot1 ~ log(u), data = clotting, family = Gamma)
sum(llcont(gam1))
logLik(gam1)




