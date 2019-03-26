library(spatstat)


### Name: as.hyperframe
### Title: Convert Data to Hyperframe
### Aliases: as.hyperframe as.hyperframe.default as.hyperframe.data.frame
###   as.hyperframe.hyperframe as.hyperframe.listof as.hyperframe.anylist
### Keywords: spatial manip

### ** Examples

   df <- data.frame(x=runif(4),y=letters[1:4])
   as.hyperframe(df)

   sims <- list()
   for(i in 1:3) sims[[i]] <- rpoispp(42)
   as.hyperframe(as.listof(sims))
   as.hyperframe(as.solist(sims))



