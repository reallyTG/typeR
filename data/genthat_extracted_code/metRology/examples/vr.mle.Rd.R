library(metRology)


### Name: vr.mle
### Title: Vangel-Rukhin Maximum Likelihood Estimate
### Aliases: vr.mle print.summary.vr.mle
### Keywords: univar

### ** Examples


     ##===================================================================
     ## the dietary fiber in apples example in the Vangel and Rukhin paper
     ##===================================================================

     m1 <- c(12.46, 13.035, 12.44, 12.87, 13.42, 12.08, 13.18, 14.335, 12.23)
     s1 <- c(0.028, 0.233, 0.325, 0.071, 0.339, 0.325, 0.099, 0.064, 0.212)
     n1 <- c(2, 2, 2, 2, 2, 2, 2, 2, 2)

     res<- vr.mle(m1, s1^2, n1, tol=1e-6)

     res$mu
     sqrt(res$var.mu)
     res$sigma2
     res$mu+c(-1,1)*qnorm(0.975)*sqrt(res$var.mu)
     res$tot.iter
     res$converged
     res$reduced.model

     # output
     # 12.90585
     # 0.2234490
     # 0.4262122
     # 12.46790 13.34380
     # 6
     # converged = TRUE
     # reduced.model = FALSE
 



