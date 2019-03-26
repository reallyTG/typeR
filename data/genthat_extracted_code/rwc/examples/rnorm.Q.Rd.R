library(rwc)


### Name: rnorm.Q
### Title: Sample random normal variables with precision matrix Q.
### Aliases: rnorm.Q
### Keywords: ~kwd1 ~kwd2

### ** Examples

ras=raster(nrow=30,ncol=30)
extent(ras) <- c(0,30,0,30)
values(ras) <- 1

int=ras
cov.ras=ras


## simulate "resistance" raster
B.int=get.TL(int)
Q.int=get.Q(B.int,1)
values(cov.ras) <- as.numeric(rnorm.Q(Q.int,zero.constraint=TRUE))
plot(cov.ras)



