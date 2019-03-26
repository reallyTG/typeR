library(mice)


### Name: parlmice
### Title: Wrapper function that runs MICE in parallel
### Aliases: parlmice

### ** Examples

# 150 imputations in dataset nhanes, performed by 3 cores  
## Not run: 
##D imp1 <- parlmice(data = nhanes, n.core = 3, n.imp.core = 50)
##D # Making use of arguments in mice. 
##D imp2 <- parlmice(data = nhanes, method = "norm.nob", m = 100)
##D imp2$method
##D fit <- with(imp2, lm(bmi ~ hyp))
##D pool(fit)
## End(Not run)




