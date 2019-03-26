library(LMfilteR)


### Name: PF_lm
### Title: Parameter Estimation Of Linear Regression Using Particle Filters
### Aliases: PF_lm

### ** Examples


## Not run: 
##D #### Using default Data1, no sigma estimation ####
##D Res <- PF_lm(n=1000L, sigma_est = FALSE)
##D lapply(Res,class) # Structure of returning list.
##D sumRes <- sapply(2:5, function(i)
##D summary(apply(Res$stateP_res[[i]],1,mean))) # Summary of estimated parameters
##D colnames(sumRes) <-  c("a0", "a1", "a2", "a3")
##D sumRes
##D par(mfrow=c(2, 2)) #Evolution of the mean of the estimation on each time
##D for (i in 2:5){
##D plot(apply(Res$stateP_res[[i]],1,mean), main = colnames(sumRes)[i-1], col="blue",
##D       xlab =  "", ylab = "",type="l")
##D }
##D 
##D 
##D #### Using default Data1, with sigma estimation ####
##D Res2 <- PF_lm(n=1000L, sigma_est = TRUE)
##D lapply(Res2,class) # Structure of returning list
##D sumRes2 <- sapply(2:6, function(i)
##D   summary(apply(Res2$stateP_res[[i]],1,mean)))# Summary of estimated parameters
##D colnames(sumRes2) <-  c("a0", "a1", "a2", "a3", "s")
##D sumRes2
##D 
##D par(mfrow=c(2, 3)) #Evolution of the mean of the particle estimation
##D for (i in 2:6){
##D plot(apply(Res2$stateP_res[[i]],1,mean), main = colnames(sumRes2)[i-1], col="blue",
##D        xlab =  "", ylab = "",type="l")
##D }
##D 
##D 
##D #### Using default Data1, given initDisPar ####
##D b0 <- matrix(c( -2, 11, # Prior of the state equation
##D                 1.9, 2, # Prior of a_0
##D                 1, 1.5, # Prior of a_1
##D                 2, 3,   # Prior of a_2
##D                 -1, 0)  # Prior of a_3
##D                 ,ncol = 2, byrow = TRUE )
##D Res3 <- PF_lm(n=1000L, sigma_est = FALSE, initDisPar = b0)
##D lapply(Res3,class) # Structure of returning list.
##D sumRes3 <- sapply(2:5, function(i)
##D           summary(apply(Res3$stateP_res[[i]],1,mean))) # Summary of estimated parameters
##D colnames(sumRes3) <-  c("a0", "a1", "a2", "a3")
##D sumRes3
##D 
##D par(mfrow=c(2, 2)) #Evolution of the mean of the particle estimation
##D for (i in 2:5){
##D plot(apply(Res3$stateP_res[[i]],1,mean), main = colnames(sumRes3)[i-1], col="blue",
##D     xlab =  "", ylab = "",type="l")
##D     }
## End(Not run)




