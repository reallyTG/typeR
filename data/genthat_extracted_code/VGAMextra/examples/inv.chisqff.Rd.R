library(VGAMextra)


### Name: inv.chisq
### Title: Inverse Chi-squared Distribution.
### Aliases: inv.chisq

### ** Examples

   set.seed(17010504)
   dof   <- 2.5 
   yy    <- rinv.chisq(100, df = dof)     
   ics.d <- data.frame(y = yy)             # The data.
 
   
   fit.inv <- vglm(cbind(y, y) ~ 1, family = inv.chisq, 
                   data = ics.d, trace = TRUE, crit = "coef")
   Coef(fit.inv) 
   summary(fit.inv)
    



