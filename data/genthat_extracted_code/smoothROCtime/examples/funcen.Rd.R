library(smoothROCtime)


### Name: funcen
### Title: Bivariate kernel density estimation under random censoring
### Aliases: funcen

### ** Examples

library(smoothROCtime)
require(KMsurv)
require(lattice)

data(kidtran)

# Preparing data: a logarithmic transformationof the time-to-event variable is made
  DT <- cbind(log(kidtran$time),kidtran$delta,kidtran$age)
  n  <-length(log(kidtran$time))

# Directly definition of the bandwidth matrix
  H  <- diag((c(sd(kidtran$age),sd(log(kidtran$time)))*n^(-0.2))^2)

# Kernel density function estimation
  density <- funcen(data=DT,H=H)

# Plot graphics
  wireframe(density$estimate, row.values=density$eval.points[[1]],
            column.values=density$eval.points[[1]],zlab="density")
  contour(x=density$eval.points[[1]],
          y=density$eval.points[[2]],
          z=density$estimate,
          ylim=c(6,10))



