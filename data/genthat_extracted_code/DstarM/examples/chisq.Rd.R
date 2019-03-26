library(DstarM)


### Name: chisq
### Title: Calculates the distance between two probability densities.
### Aliases: chisq battacharyya hellinger

### ** Examples

# Lets simulate a bunch of parameters and compare the three distance measures.

tt = seq(0, 5, .001)
parsMatV = cbind(.8, seq(0, 5, .5), .5, .5, .5) # differ only in drift speed
parsMatA = cbind(seq(.5, 2, .15), 2, .5, .5, .5)# differ only in boundary
# calculate densities for all these parameters
dV = apply(parsMatV, 1, function(x, tt) Voss.density(tt, x, boundary = 'upper'), tt = tt)
dA = apply(parsMatA, 1, function(x, tt) Voss.density(tt, x, boundary = 'upper'), tt = tt)
# make plots of the densities
matplot(tt, dA, xlim = c(0, .6), main = 'Densities with different Boundary',
        col = rainbow(ncol(dA)),type = 'l', lty = 1, las = 1, bty = 'n',
        xlab = 'Time', ylab = 'Density')
legend('topright', lty = 1, bty = 'n', col = rainbow(ncol(dA)),
       legend = paste('a = ', parsMatA[, 1]))
matplot(tt, dV, xlim = c(0, .6), main = 'Densities with different Drift Speed',
        col = rainbow(ncol(dV)), type = 'l', lty = 1, las = 1, bty = 'n',
        xlab = 'Time', ylab = 'Density')
legend('topright', lty = 1, bty = 'n', col = rainbow(ncol(dV)),
       legend = paste('v = ',parsMatV[, 2]))
# empty matrices for data storage
distMatV = matrix(NA, nrow = ncol(dV) - 1, ncol = 3,
                  dimnames = list(NULL, c('Chisq', 'Bhattacharyya', 'Hellinger')))
distMatA = matrix(NA, nrow = ncol(dA) - 1, ncol = 3,
                  dimnames = list(NULL, c('Chisq', 'Bhattacharyya', 'Hellinger')))
# calculate distances between densities in column i and i + 1.
# this is done using three different distance measures
for (i in 1:(ncol(dA) - 1)) {
  distMatV[i, ] = c(chisq(tt, dV[, i], dV[, i + 1]),
                    battacharyya(tt, dV[, i], dV[, i + 1]),
                    hellinger(tt, dV[, i], dV[, i + 1]))
  distMatA[i, ] = c(chisq(tt, dA[, i], dA[, i + 1]),
                    battacharyya(tt, dA[, i], dA[, i + 1]),
                    hellinger(tt, dA[, i], dA[, i + 1]))
}
# The three distance measures correlate highly for differences in Boundary
cor(distMatA)
# The battacharyya distance measures does not correlate with the others
# when calculating differences in drift speed
cor(distMatV)



