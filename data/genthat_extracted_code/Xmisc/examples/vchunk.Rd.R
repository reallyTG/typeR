library(Xmisc)


### Name: vchunk
### Title: Chunk a vector into parts
### Aliases: vchunk

### ** Examples

vchunk(1:7,7)
vchunk(1:19,n=3)
vchunk(1:19,max.size=9) # size-balanced
vchunk(1:19,max.size=9,balance.size=FALSE) # size/order-unbalanced
vchunk(1:19,max.size=9,balance.size=FALSE,balance.order=TRUE) # order-balanced
vchunk(1:19,max.size=9,balance.order=TRUE) # size/order-balanced



