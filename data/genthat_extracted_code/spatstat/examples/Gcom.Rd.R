library(spatstat)


### Name: Gcom
### Title: Model Compensator of Nearest Neighbour Function
### Aliases: Gcom
### Keywords: spatial models

### ** Examples

    data(cells)
    fit0 <- ppm(cells, ~1) # uniform Poisson
    G0 <- Gcom(fit0)
    G0
    plot(G0)
# uniform Poisson is clearly not correct

# Hanisch estimates only
    plot(Gcom(fit0), cbind(han, hcom) ~ r)

    fit1 <- ppm(cells, ~1, Strauss(0.08))
    plot(Gcom(fit1), cbind(han, hcom) ~ r)

# Try adjusting interaction distance

    fit2 <- update(fit1, Strauss(0.10))
    plot(Gcom(fit2), cbind(han, hcom) ~ r)

    G3 <- Gcom(cells, interaction=Strauss(0.12))
    plot(G3, cbind(han, hcom) ~ r)



