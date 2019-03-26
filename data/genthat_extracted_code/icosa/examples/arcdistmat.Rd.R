library(icosa)


### Name: arcdistmat
### Title: Calculation of distance matrices along arcs
### Aliases: arcdistmat

### ** Examples

g <- trigrid(c(4))
res <- arcdistmat(g@vertices)

rand<-rpsphere(500)
res2 <- arcdistmat(g@vertices, rand)




