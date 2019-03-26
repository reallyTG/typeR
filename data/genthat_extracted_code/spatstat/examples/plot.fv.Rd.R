library(spatstat)


### Name: plot.fv
### Title: Plot Function Values
### Aliases: plot.fv
### Keywords: spatial hplot

### ** Examples

   K <- Kest(cells)
   # K is an object of class "fv"

   plot(K, iso ~ r)                # plots iso against r

   plot(K, sqrt(iso/pi) ~ r)   # plots sqrt(iso/r)  against r

   plot(K, cbind(iso,theo) ~ r)   # plots iso against r  AND theo against r

   plot(K, .  ~ r)            # plots all available estimates of K against r

   plot(K, sqrt(./pi) ~ r)   # plots all estimates of L-function
                             # L(r) = sqrt(K(r)/pi)

   plot(K, cbind(iso,theo) ~ r, col=c(2,3))
                                   # plots iso against r  in colour 2
                                   # and theo against r in colour 3

   plot(K, iso ~ r, subset=quote(r < 0.2))
                                   # plots iso against r for r < 10

   # Can't remember the names of the columns? No problem..
   plot(K, sqrt(./pi) ~ .x)

   # making a legend by hand
   v <- plot(K, . ~ r, legend=FALSE)
   legend("topleft", legend=v$meaning, lty=v$lty, col=v$col)

   # significance bands
   KE <- envelope(cells, Kest, nsim=19)
   plot(KE, shade=c("hi", "lo"))

   # how to display two functions on a common scale
   Kr <- Kest(redwood)
   a <- plot(K, limitsonly=TRUE)
   b <- plot(Kr, limitsonly=TRUE)
   xlim <- range(a$xlim, b$xlim)
   ylim <- range(a$ylim, b$ylim)
   opa <- par(mfrow=c(1,2))
   plot(K, xlim=xlim, ylim=ylim)
   plot(Kr, xlim=xlim, ylim=ylim)
   par(opa)



