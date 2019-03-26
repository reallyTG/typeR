library(spatstat)


### Name: compareFit
### Title: Residual Diagnostics for Multiple Fitted Models
### Aliases: compareFit
### Keywords: spatial models

### ** Examples

   nd <- 40
   ## Don't show: 
        nd <- 10
   
## End(Don't show)
   ilist <- list(Poisson(), Geyer(7, 2), Strauss(7))
   iname <- c("Poisson", "Geyer", "Strauss")
   ## Don't show: 
      ilist <- ilist[c(1,3)]
      iname <- iname[c(1,3)]
   
## End(Don't show)
   K <- compareFit(swedishpines, Kcom, interaction=ilist, rbord=9,
            correction="translate",
            same="trans", different="tcom", modelnames=iname, nd=nd)
   K



