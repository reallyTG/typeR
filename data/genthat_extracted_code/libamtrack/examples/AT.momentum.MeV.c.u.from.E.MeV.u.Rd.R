library(libamtrack)


### Name: AT.momentum.MeV.c.u.from.E.MeV.u
### Title: AT.momentum.MeV.c.u.from.E.MeV.u
### Aliases: AT.momentum.MeV.c.u.from.E.MeV.u

### ** Examples

# Relation between kinetic proton energy and momentum
# in relativistic and non-relativistic regime
E.MeV.u     <- 10^seq(-2, 5, length.out = 100)
df          <- data.frame( E.MeV          = E.MeV.u,
                           p.MeV.c        =
 AT.momentum.MeV.c.u.from.E.MeV.u(E.MeV.u)$momentum.MeV.c)



