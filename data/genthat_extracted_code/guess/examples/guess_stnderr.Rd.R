library(guess)


### Name: guess_stnderr
### Title: Bootstrapped standard errors of effect size estimates
### Aliases: guess_stnderr

### ** Examples

pre_test <- data.frame(pre_item1=c(1,0,0,1,0), pre_item2=c(1,NA,0,1,0)) 
pst_test <- data.frame(pst_item1=pre_test[,1] + c(0,1,1,0,0), 
					  pst_item2 = pre_test[,2] + c(0,1,0,0,1))
## Not run: guess_stnderr(pre_test, pst_test, nsamps=10, seed = 31415)



