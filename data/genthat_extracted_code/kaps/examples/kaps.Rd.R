library(kaps)


### Name: kaps
### Title: K-adaptive partitioing for survival data
### Aliases: kaps
### Keywords: kaps

### ** Examples

  ## Not run: 
##D     data(toy)
##D     f <- Surv(time, status) ~ meta
##D     # Fit kaps algorithm without cross-validation.
##D     # It means the step to finding optimal K is not entered.
##D     fit1 <- kaps(f, data = toy, K = 3)
##D 
##D     # show the object of kaps (it contains apss S4 class)
##D     fit1
##D 
##D     # plot Kaplan-Meire estimates
##D     plot(fit1)
##D 
##D     # Fit kaps algorithm for selection optimal number of subgropus.
##D     fit2 <- kaps(f, data = toy, K= 2:4) 
##D     fit2
##D 
##D     # plot outputs with subgroup selection
##D     require(locfit) # for scatterplot smoothing
##D     plot(fit2)
##D 
##D     print(fit2,K=2)
##D     summary(fit2)
##D     summary(fit2,K=2)
##D 
##D     # require(party)
##D     # fit4 <- ctree(f, data = toy)
##D   
## End(Not run)



