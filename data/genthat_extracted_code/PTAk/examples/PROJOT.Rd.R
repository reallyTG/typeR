library(PTAk)


### Name: PROJOT
### Title: Orthogonal Tensor projection
### Aliases: PROJOT
### Keywords: array algebra multivariate

### ** Examples


don <- array(1:360,c(5,4,6,3))
 don <- don + rnorm(360,10,2)

 ones <- list(list(v=rep(1,5)),list(v=rep(1,4)),list(v=rep(1,6)),list(v=rep(1,3)))
 donfc <- PROJOT(don,ones)

 apply(donfc,c(2,3,4),mean)
 apply(donfc,c(1),mean)

  # implementation de PTAIVk with obvious settings
 PTAIVk <- function(X,STruct,...)
         {X <- PROJOT(X$data,STruct,numo=Struct[[1]]$numo,Ortho=Struct[[1]]$Ortho,metrics=X$met)
         PTAk(X,...)
         }

   


