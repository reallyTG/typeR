library(circular)


### Name: KatoJones
### Title: Kato and Jones Density Function
### Aliases: rkatojones dkatojones
### Keywords: distribution circle circular

### ** Examples

data1 <- rkatojones(n=100, mu=circular(0), nu=circular(pi/4), r=.2, kappa=1)
plot(data1)

data1 <- rkatojones(n=100, mu=circular(pi/3), nu=circular(pi), r=.7, kappa=2.3)
plot(data1)

ff <- function(x) dkatojones(x, mu=circular(pi/3), nu=circular(pi), r=.7, kappa=2.3)
curve.circular(ff, join=TRUE, xlim=c(-1, 1), ylim=c(-1.2, 1.2),
  main="Density of a KatoJones Distribution",
  xlab=expression(paste(mu,"=",pi,"/3, ",nu,"=",pi,", r=0.7, ",kappa,"=2.3"))
  )



