library(agridat)


### Name: pearl.kernels
### Title: Counts of yellow/white and sweet/starchy maize kernels by 15
###   observers
### Aliases: pearl.kernels

### ** Examples


data(pearl.kernels)
dat <- pearl.kernels

require(lattice)
xyplot(ys+yt+ws+wt~obs|ear, dat, type='l', as.table=TRUE,
       auto.key=list(columns=4),
       main="pearl.kernels", xlab="observer",ylab="kernels",
       layout=c(4,1), scales=list(x=list(rot=90)))

# Test hypothesis that distribution is 'Mendelian' 9:3:3:1
dat$pval <- apply(dat[, 3:6], 1, function(x)
                  chisq.test(x, p=c(9,3,3,1)/16)$p.val)
dotplot(pval~obs|ear, dat, layout=c(1,4), main="pearl.kernels",
        ylab="P-value for test of 9:3:3:1 distribution")




