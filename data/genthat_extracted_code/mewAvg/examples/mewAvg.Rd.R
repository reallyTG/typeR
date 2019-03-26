library(mewAvg)


### Name: mewAvg
### Title: Convenience wrapper for the MEW process
### Aliases: mewAvg

### ** Examples

MyFun <- function (k) {

 value <- runif(n=2)
 value[1] <- ((cos(value[1]*2*pi))^2)*(1 - exp(-0.01*k))
 value[2] <- (-((sin(value[2]*2*pi))^2))*(1 - exp(-0.01*k))

 k <- k + 1

 return(list(value=value, k=k))
}

i.to.save <- seq(from=1, to=1025, by=32)
tmp <- rep(x=0, times=1025)
tmp[i.to.save] <- 1
i.to.save <- tmp

mean.vals <- mewAvg(f=MyFun,
                    n.bin=4,
                    n.xx=2,
                    ff=0.5,
                    n.save=sum(i.to.save),
                    n.iter=length(i.to.save),
                    i.to.save=i.to.save,
                    k=1)

plot(c(1:sum(i.to.save),
       1:sum(i.to.save)),
     c(mean.vals[, 1],
       mean.vals[, 2]),
     type="n",
     xlab="Saved Iter",
     ylab="Mean")
points(1:sum(i.to.save),
       mean.vals[, 1])
points(1:sum(i.to.save),
       mean.vals[, 2])

## an AR(1) process

ArOne <- function (x.old, phi, sig.eps) {

  value <- phi*x.old + rnorm(n=1, mean=0, sd=sig.eps)

  return(list(value=value, x.old=value))
}

mean.vals.ar1 <- mewAvg(f=ArOne,
                        n.bin=4,
                        n.xx=1,
                        ff=0.5,
                        n.save=sum(i.to.save),
                        n.iter=length(i.to.save),
                        i.to.save=i.to.save,
                        x.old=0,
                        phi=0.5,
                        sig.eps=1)

plot(x=c(1, sum(i.to.save)),
     y=c(-0.5, 0.5),
     xlab="Saved Iter",
     ylab="Mean",
     type="n")
points(x=1:sum(i.to.save),
       y=mean.vals.ar1)
abline(h=0, col="red")



