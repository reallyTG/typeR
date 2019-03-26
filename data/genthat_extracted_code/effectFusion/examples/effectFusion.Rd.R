library(effectFusion)


### Name: effectFusion
### Title: Bayesian effect fusion for categorical predictors
### Aliases: effectFusion

### ** Examples

## Not run: 
##D # ----------- Load simulated data set 'sim1' for linear regression
##D data(sim1)
##D y = sim1$y
##D X = sim1$X
##D types = sim1$types
##D 
##D # ----------- Bayesian effect fusion for simulated data set with spike and slab prior
##D m1 <- effectFusion(y, X, types, method = 'SpikeSlab')
##D 
##D # print, summarize and plot results
##D print(m1)
##D summary(m1)
##D plot(m1)
##D 
##D # evaluate model and model criteria
##D model(m1)
##D dic(m1)
##D 
##D # ----------- Use finite mixture prior for comparison
##D m2 <- effectFusion(y, X, types, method = 'FinMix')
##D 
##D # summarize and plot results
##D print(m2)
##D summary(m2)
##D plot(m2)
##D model(m2)
##D dic(m2)
##D 
##D # change prior parameter specification
##D m3 <- effectFusion(y, X, types, prior= list(p = 10^3), method = 'FinMix')
##D plot(m3)
##D 
##D # ------------  Use model averaged coefficient estimates
##D m4 <- effectFusion(y, X, types, method = 'SpikeSlab', modelSelection = NULL)
##D summary(m4)
##D 
##D # ------------  Estimate full model for comparison purposes
##D m5 <- effectFusion(y, X, types, method = NULL)
##D summary(m5)
##D plot(m5)
##D dic(m5)
##D 
##D # ----------- Load simulated data set 'sim3' for logistic regression
##D data(sim3)
##D y = sim3$y
##D X = sim3$X
##D types = sim3$types
##D 
##D # ----------- Bayesian effect fusion for simulated data set with finite mixture prior
##D m6 <- effectFusion(y, X, types, method = 'FinMix', prior = list(p = 10^4), family = 'binomial')
##D 
##D # look at the results
##D print(m6)
##D summary(m6)
##D plot(m6)
##D model(m6)
##D dic(m6)
##D 
##D # ----------- Use spike and slab prior for comparison
##D m7 <- effectFusion(y, X, types, method = 'SpikeSlab', family = 'binomial', returnBurnin = TRUE)
##D 
##D # summarize and evaluate results
##D print(m7)
##D summary(m7)
##D plot(m7)
##D model(m7)
##D dic(m7)
## End(Not run)



