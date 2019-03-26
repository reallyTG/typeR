library(HardyWeinberg)


### Name: mac
### Title: Compute the minor allele count.
### Aliases: mac
### Keywords: misc

### ** Examples

   X <- as.vector(rmultinom(1,100,c(0.5,0.4,0.1)))
   names(X) <- c("AA","AB","BB")
   print(X)
   print(mac(X))



