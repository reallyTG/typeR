library(DoE.base)


### Name: expansive.replace
### Title: Expansive replacement for two orthogonal arrays
### Aliases: expansive.replace
### Keywords: array design

### ** Examples

myL24.2.14.6.1 <- expansive.replace(L24.2.12.12.1, L12.2.2.6.1)

L96.2.6.3.1.4.2_list <- expansive.replace(L96.2.5.4.2.6.1, 
      cbind(U=rep(c(1,2),each=3), V=rep(1:3,2)), all=TRUE)
## the list of 60 resolution IV arrays can be used for design creation, 
## e.g. as follows:
## Not run: 
##D      ## resolution IV designs obtained from the 60 different arrays
##D      deslist <- lapply(L96.2.6.3.1.4.2_list, 
##D          function(aa) oa.design(aa, nlevels=c(2,2,2,2,3,4,4), columns="min34"))
##D      table(A4s <- sapply(deslist, length4))  ## a single best design exists
##D      best <- deslist[[which(A4s < 2)]]
##D      GWLP(best)
## End(Not run)



