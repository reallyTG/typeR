library(quantable)


### Name: distmy
### Title: distance among matrix columns with freely choosable distance
###   function
### Aliases: distmy

### ** Examples

mat = matrix(rnorm(10*5000),ncol=10)
redist = distmy(mat,function(x,y){mean(abs(x-y))},init=NA,diag=FALSE)
image(redist)
redist = distmy(mat,cor,init=0,diag=FALSE)
image(redist)
redist = distmy(mat,function(x,y){ks.test(x,y)$p.value},init=1,diag=TRUE)
image(redist)
hist(uppertriang(redist))
range(uppertriang(redist))
which(redist < 0.05 , arr.ind = TRUE)



