library(rrscale)


### Name: rrscale
### Title: Re-scale a data matrix
### Aliases: rrscale

### ** Examples

Y <- rlnorm(10)%*%t(rlnorm(10))
rr.out <- rrscale(Y,run_parallel=FALSE)
Yt <- rr.out$RR



