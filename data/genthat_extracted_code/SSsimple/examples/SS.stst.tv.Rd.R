library(SSsimple)


### Name: SS.stst.tv
### Title: Steady State
### Aliases: SS.stst.tv
### Keywords: ~kwd1 ~kwd2

### ** Examples

F.tv <- list()
for(i in 1:10000) {
	F.tv[[i]] <- diag( c(1/(i+10), 1/(i+10)) )
}

H <- matrix(1, 2, 2)

SS.stst.tv(F.tv, H, 1, 1, 10^5, 10^(-10), verbosity=2)



