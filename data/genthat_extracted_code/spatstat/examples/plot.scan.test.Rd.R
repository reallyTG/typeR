library(spatstat)


### Name: plot.scan.test
### Title: Plot Result of Scan Test
### Aliases: plot.scan.test as.im.scan.test
### Keywords: htest spatial

### ** Examples

   if(interactive()) {
     a <- scan.test(redwood, seq(0.04, 0.1, by=0.01),
                    method="poisson", nsim=19)
   } else {
     a <- scan.test(redwood, c(0.05, 0.1), method="poisson", nsim=2)
   }
   plot(a)
   as.im(a)
   plot(a, what="radius")



