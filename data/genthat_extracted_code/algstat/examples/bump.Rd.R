library(algstat)


### Name: bump
### Title: Convert Dimensions of Approval Data
### Aliases: bump

### ** Examples

## Not run: 
##D 
##D V0 <- 100 # V0 = number of voters (not votes)
##D bump(V0, 6, 3, 0, 0) # no bump
##D bump(V0, 6, 3, 0, 1) # 1-up
##D bump(V0, 6, 3, 0, 2) # 2-up
##D bump(V0, 6, 3, 0, 3) # 3-up
##D 
##D V1 <- c(30, 40, 50, 50, 60, 70)
##D bump(V1, 6, 3, 1, 0) # bump down
##D bump(V1, 6, 3, 1, 1) # no bump
##D bump(V1, 6, 3, 1, 2) # 1-up
##D bump(V1, 6, 3, 1, 3) # 2-up
##D 
##D cbind(
##D   bump(V1, 6, 3, 1, 2, "popular"),
##D   bump(V1, 6, 3, 1, 2, "even")
##D )
##D 
##D 
##D 
##D 
##D 
##D data(cookie)
##D (out <- spectral(cookie$freq, 6, 3, cookie$cookies))
##D 
##D (V0 <- out$obs$V0)
##D bump(V0, 6, 3, 0, 0)
##D bump(V0, 6, 3, 0, 1)
##D bump(V0, 6, 3, 0, 2)
##D bump(V0, 6, 3, 0, 3)
##D out$fullExp$V0
##D out$decompose(out$effects[,1])
##D 
##D (V1 <- out$obs$V1)
##D bump(V1, 6, 3, 1, 0) # cbind(bump(V1, 6, 3, 1, 0), out$fullExp$V1[[1]])
##D bump(V1, 6, 3, 1, 1) # cbind(bump(V1, 6, 3, 1, 1), out$fullExp$V1[[2]])
##D bump(V1, 6, 3, 1, 2) # cbind(bump(V1, 6, 3, 1, 2), out$fullExp$V1[[3]])
##D bump(V1, 6, 3, 1, 3) # cbind(bump(V1, 6, 3, 1, 3), out$fullExp$V1[[4]])
##D out$fullExp$V1 # the sampler doesn't distribute it's samples up evenly
##D 
##D (V2 <- out$obs$V2)
##D bump(V2, 6, 3, 2, 0) # cbind(bump(V2, 6, 3, 2, 0), out$fullExp$V2[[1]])
##D bump(V2, 6, 3, 2, 1) # cbind(bump(V2, 6, 3, 2, 1), out$fullExp$V2[[2]])
##D bump(V2, 6, 3, 2, 2) # cbind(bump(V2, 6, 3, 2, 2), out$fullExp$V2[[3]])
##D bump(V2, 6, 3, 2, 3) # cbind(bump(V2, 6, 3, 2, 3), out$fullExp$V2[[4]])
##D 
##D (V3 <- out$obs$V3)
##D bump(V3, 6, 3, 3, 0)
##D bump(V3, 6, 3, 3, 1)
##D bump(V3, 6, 3, 3, 2)
##D bump(V3, 6, 3, 3, 3)
##D 
##D 
##D 
## End(Not run)



