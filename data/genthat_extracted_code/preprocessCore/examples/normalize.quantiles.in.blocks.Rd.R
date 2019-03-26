library(preprocessCore)


### Name: normalize.quantiles.in.blocks
### Title: Quantile Normalization carried out separately within blocks of
###   rows
### Aliases: normalize.quantiles.in.blocks
### Keywords: manip

### ** Examples

   ### setup the data
   blocks <- c(rep(1,5),rep(2,5),rep(3,5))
   par(mfrow=c(3,2))
   x <- matrix(c(rexp(5,0.05),rnorm(5),rnorm(5,10)))
   boxplot(x ~ blocks)
   y <- matrix(c(-rexp(5,0.05),rnorm(5,10),rnorm(5)))
   boxplot(y ~ blocks)
   pre.norm <- cbind(x,y)

   ### the in.blocks version
   post.norm <- normalize.quantiles.in.blocks(pre.norm,blocks)
   boxplot(post.norm[,1] ~ blocks)
   boxplot(post.norm[,2] ~ blocks)

   ### the usual version
   post.norm  <- normalize.quantiles(pre.norm)
   boxplot(post.norm[,1] ~ blocks)
   boxplot(post.norm[,2] ~ blocks)
 


