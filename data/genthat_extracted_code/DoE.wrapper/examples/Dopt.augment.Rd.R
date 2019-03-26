library(DoE.wrapper)


### Name: Dopt.augment
### Title: Function for augmenting a design with D-optimal additional
###   points using optFederov from package AlgDesign
### Aliases: Dopt.augment
### Keywords: array design

### ** Examples

   ## a full quadratic model with constraint in three quantitative factors 
   plan <- Dopt.design(36,factor.names=list(eins=c(100,250),zwei=c(10,30),drei=c(-25,25)),
                          nlevels=c(4,3,6), 
                          formula=~quad(.), 
                          constraint="!(eins>=200 & zwei==30 & drei==25)")
   summary(plan)
   y <- rnorm(36)
   r.plan <- add.response(plan, y)
   plan2 <- Dopt.augment(r.plan, m=10)
   summary(plan2)
   ## add the new response values after conducting additional experiments
   y <- c(y, rnorm(10))
   r.plan2 <- add.response(plan2,y, replace=TRUE)
   summary(r.plan2, brief=FALSE)
   



