library(uGMAR)


### Name: randomIndividual
### Title: Create somewhat random GMAR, StMAR or G-StMAR model compatible
###   parameter vector
### Aliases: randomIndividual smartIndividual

### ** Examples

# GMAR model parameter vector
params22 <- randomIndividual(2, 2, meanscale=c(0, 1), sigmascale=1)
smart22 <- smartIndividual(2, 2, params22, accuracy=10)
cbind(params22, smart22)


# Restricted GMAR parameter vector
params12r <- randomIndividual(1, 2, restricted=TRUE, meanscale=c(-2, 2), sigmascale=2)
smart12r <- smartIndividual(1, 2, params12r, restricted=TRUE, accuracy=20)
cbind(params12r, smart12r)


# StMAR parameter vector: first regime is random in the "smart individual"
params13t <- randomIndividual(1, 3, model="StMAR", meanscale=c(3, 1), sigmascale=3)
smart13t <- smartIndividual(1, 3, params13t, model="StMAR", accuracy=15,
                            meanscale=c(3, 3), sigmascale=3, whichRandom=1)
cbind(params13t, smart13t)


# Restricted StMAR parameter vector
params22tr <- randomIndividual(2, 2, model="StMAR", restricted=TRUE,
                               meanscale=c(3, 2), sigmascale=0.5)
smart22tr <- smartIndividual(2, 2, params22tr, model="StMAR", restricted=TRUE,
                             accuracy=30)
cbind(params22tr, smart22tr)


# G-StMAR parameter vector
params12gs <- randomIndividual(1, c(1, 1), model="G-StMAR", meanscale=c(0, 1),
                               sigmascale=1)
smart12gs <- smartIndividual(1, c(1, 1), params12gs, model="G-StMAR", accuracy=20)
cbind(params12gs, smart12gs)


# Restricted G-StMAR parameter vector
params23gsr <- randomIndividual(2, c(1, 2), model="G-StMAR", restricted=TRUE,
                                meanscale=c(-1, 1), sigmascale=3)
smart23gsr <- smartIndividual(2, c(1, 2), params23gsr, model="G-StMAR", restricted=TRUE,
                              meanscale=c(0, 1), sigmascale=1, accuracy=20, whichRandom=2)
cbind(params23gsr, smart23gsr)


# GMAR model as a mixture of AR(2) and AR(1) models
C <- list(diag(1, ncol=2, nrow=2), as.matrix(c(1, 0)))
params22c <- randomIndividual(2, 2, constraints=C, meanscale=c(1, 1),
                              sigmascale=1)
smart22c <- smartIndividual(2, 2, params22c, constraints=C, accuracy=10)
cbind(params22c, smart22c)


# Such constrained StMAR(3, 2) model that the second order AR coefficients
# are constrained to zero.
C0 = matrix(c(1, 0, 0, 0, 0, 1), ncol=2)
C = list(C0, C0)
params32c <- randomIndividual(3, 2, model="StMAR", constraints=C,
                              meanscale=c(1, 1), sigmascale=1)
smart32c <- smartIndividual(3, 2, params32c, model="StMAR", constraints=C, accuracy=10)
cbind(params32c, smart32c)


# Such StMAR(3,2) that the AR coefficients are restricted to be
# the same for both regimes and that the second AR coefficients are
# constrained to zero. Second regime is random in the "smart individual".
params32trc <- randomIndividual(3, 2, model="StMAR", restricted=TRUE,
                                constraints=matrix(c(1, 0, 0, 0, 0, 1), ncol=2),
                                meanscale=c(-2, 0.5), sigmascale=4)
smart32trc <- smartIndividual(3, 2, params32trc, model="StMAR", restricted=TRUE,
                              constraints=matrix(c(1, 0, 0, 0, 0, 1), ncol=2),
                              meanscale=c(0, 0.1), sigmascale=0.1, whichRandom=2,
                              accuracy=20)
cbind(params32trc, smart32trc)



