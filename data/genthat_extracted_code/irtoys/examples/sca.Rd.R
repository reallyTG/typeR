library(irtoys)


### Name: sca
### Title: Linear transformation of the IRT scale
### Aliases: sca
### Keywords: models

### ** Examples


## Not run: 
##D # a small simulation to demonstrate transformation to a common scale
##D # fake 50 2PL items
##D pa <- cbind(runif(50,.8,2), runif(50,-2.4,2.4), rep(0,50))
##D # simulate responses with  two samples of different ability levels
##D r.1 <- sim(ip=pa[1:30,],  x=rnorm(1000,-.5))
##D r.2 <- sim(ip=pa[21:50,], x=rnorm(1000,.5))
##D # estimate item parameters
##D p.1 <- est(r.1, engine="ltm")
##D p.2 <- est(r.2, engine="ltm")
##D # plot difficulties to show difference in scale
##D plot(c(-3,3), c(-3,3), ty="n", xlab="True",ylab="Estimated",
##D    main="Achieving common scale")
##D text(pa[1:30,2],  p.1$est[,2], 1:30)
##D text(pa[21:50,2], p.2$est[,2], 21:50, co=2)
##D # scale with the default Mean/Sigma method
##D pa.sc = sca(old.ip=p.1$est, new.ip=p.2$est, old.items=21:30, new.items=1:10)
##D # add difficulties of scaled items to plot
##D text(pa[21:50,2], pa.sc$scaled.ip[,2], 21:50, co=3)
## End(Not run)




