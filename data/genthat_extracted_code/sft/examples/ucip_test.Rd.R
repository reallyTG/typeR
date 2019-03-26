library(sft)


### Name: ucip.test
### Title: A Statistical Test for Super or Limited Capacity
### Aliases: ucip.test
### Keywords: ~sft

### ** Examples

rate1 <- .35
rate2 <- .3
RT.pa <- rexp(100, rate1)
RT.ap <- rexp(100, rate2)

CR.pa <- runif(100) < .98
CR.ap <- runif(100) < .98
CR.pp <- runif(100) < .96
CRlist <- list(CR.pp, CR.pa, CR.ap)

#  OR Processing
RT.pp.limited <- pmin( rexp(100, .5*rate1), rexp(100, .5*rate2))
RT.pp.unlimited <- pmin( rexp(100, rate1), rexp(100, rate2))
RT.pp.super <- pmin( rexp(100, 2*rate1), rexp(100, 2*rate2))
z.limited   <- ucip.test(RT=list(RT.pp.limited, RT.pa, RT.ap), CR=CRlist, stopping.rule="OR")
z.unlimited <- ucip.test(RT=list(RT.pp.unlimited, RT.pa, RT.ap), CR=CRlist, stopping.rule="OR")
z.super     <- ucip.test(RT=list(RT.pp.super, RT.pa, RT.ap), CR=CRlist, stopping.rule="OR")

#  AND Processing
RT.pp.limited <- pmax( rexp(100, .5*rate1), rexp(100, .5*rate2))
RT.pp.unlimited <- pmax( rexp(100, rate1), rexp(100, rate2))
RT.pp.super <- pmax( rexp(100, 2*rate1), rexp(100, 2*rate2))
z.limited   <- ucip.test(RT=list(RT.pp.limited, RT.pa, RT.ap), CR=CRlist, stopping.rule="AND")
z.unlimited <- ucip.test(RT=list(RT.pp.unlimited, RT.pa, RT.ap), CR=CRlist, stopping.rule="AND")
z.super     <- ucip.test(RT=list(RT.pp.super, RT.pa, RT.ap), CR=CRlist, stopping.rule="AND")



