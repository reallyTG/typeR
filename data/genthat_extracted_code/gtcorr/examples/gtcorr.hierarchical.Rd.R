library(gtcorr)


### Name: gtcorr.hierarchical
### Title: Calculate the efficiency of hierarchical group testing
###   procedures for nested and random arrangements
### Aliases: gtcorr.hierarchical

### ** Examples

##Plot efficiencies of a Dorfman (2 stage hierarchical) algorithm 
##by cluster size and sigma
m <- 2^(0:8)
sig.0 <- gtcorr.hierarchical(n=256, p=.001, m=m, sigma=0)$efficiency
sig.05 <- gtcorr.hierarchical(n=256, p=.001, m=m, sigma=0.05)$efficiency
sig.5 <- gtcorr.hierarchical(n=256, p=.001, m=m, sigma=0.5)$efficiency
sig.99 <- gtcorr.hierarchical(n=256, p=.001, m=m, sigma=.99)$efficiency

plot(m, sig.99, log="x", type='b', ylab="Efficiency", axes=FALSE)
box()
axis(1, at=m)
axis(2)
lines(m, sig.5, type='b', pch=22)
lines(m, sig.05, type='b', pch=23)
lines(m, sig.0, type='b', pch=24)
legend('bottomleft', c("sigma=0", "sigma=0.05", "sigma=0.5",
"sigma=0.99"), pch=21:24)



