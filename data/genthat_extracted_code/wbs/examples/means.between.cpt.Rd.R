library(wbs)


### Name: means.between.cpt
### Title: Means between change-points
### Aliases: means.between.cpt

### ** Examples

x <- rnorm(100)+c(rep(-1,50),rep(1,50))
cpt <- 50
means.between.cpt(x,cpt)
w <- wbs(x)
cpt <- changepoints(w)
means.between.cpt(x,cpt=cpt$cpt.ic$sbic)



