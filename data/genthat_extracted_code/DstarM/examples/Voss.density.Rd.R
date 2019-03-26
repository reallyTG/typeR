library(DstarM)


### Name: Voss.density
### Title: Calculate model density for a given set of parameters
### Aliases: Voss.density LBA.density Wiener.density

### ** Examples

t = seq(0, .75, .01)
V.pars = c(1, 2, .5, .5, .5)
L.pars = c(1, .5, 2, 1, 1, 1)
W.pars = V.pars[1:3]
V1 = Voss.density(t = t, pars = V.pars, boundary = 'upper', DstarM = TRUE)
V2 = Voss.density(t = t, pars = V.pars, boundary = 'lower', DstarM = TRUE)
L1 = LBA.density(t = t, pars = L.pars, boundary = 'upper', DstarM = TRUE)
L2 = LBA.density(t = t, pars = L.pars, boundary = 'lower', DstarM = TRUE)
W1 = Wiener.density(t = t, pars = W.pars, boundary = 'upper', DstarM = TRUE)
W2 = Wiener.density(t = t, pars = W.pars, boundary = 'lower', DstarM = TRUE)
densities = cbind(V1, V2, L1, L2, W1, W2)
matplot(t, densities, type = 'b', ylab = 'Density', lty = 1, las = 1, bty = 'n',
        col = rep(1:3, each = 2), pch = c(0, 15, 1, 16, 2, 17), cex = .8,
        main = 'Model densities')
legend('topright', legend = c('Voss', 'LBA', 'RWiener'), lty = 1,
       pch = 15:17, col = 1:3, bty = 'n')






