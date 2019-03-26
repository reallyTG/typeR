library(spatstat)


### Name: ppx
### Title: Multidimensional Space-Time Point Pattern
### Aliases: ppx
### Keywords: spatial datagen

### ** Examples

   df <- data.frame(x=runif(4),y=runif(4),t=runif(4),
                    age=rep(c("old", "new"), 2),
                    size=runif(4))
   X <- ppx(data=df, coord.type=c("s","s","t","m","m"))
   X

   val <- 20 * runif(4)
   E <- lapply(val, function(s) { rpoispp(s) })
   hf <- hyperframe(t=val, e=as.listof(E))
   Z <- ppx(data=hf, domain=c(0,1))
   Z



