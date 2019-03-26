library(epoc)


### Name: plapply
### Title: Parallell list apply
### Aliases: plapply
### Keywords: iteration list

### ** Examples

X1 <- array(1:4,dim=c(2,2))
X2 <- array(5:8,dim=c(2,2))
X3 <- array(9:12,dim=c(2,2))
X4 <- array(13:16,dim=c(2,2))
l <- plapply(list(X1,X2),list(X3,X4), function(E1,E2) E2 - E1)
stopifnot(all(sapply(l,sum)/4 == 4*2))



