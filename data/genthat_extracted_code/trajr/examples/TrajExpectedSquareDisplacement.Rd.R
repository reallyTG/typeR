library(trajr)


### Name: TrajExpectedSquareDisplacement
### Title: Trajectory expected square displacement
### Aliases: TrajExpectedSquareDisplacement

### ** Examples

set.seed(1)
# A random walk
trj <- TrajGenerate(200)
smoothed <- TrajSmoothSG(trj)

# Calculate actual squared displacement at all points along the trajectory
sd2 <- sapply(2:nrow(smoothed), function(n) TrajDistance(smoothed, 1, n) ^ 2)
# Calculate expected squared displacement
ed2_1 <- sapply(2:nrow(smoothed), function(n) TrajExpectedSquareDisplacement(smoothed, n, TRUE))
ed2_2 <- sapply(2:nrow(smoothed), function(n) TrajExpectedSquareDisplacement(smoothed, n, FALSE))

# Plot expected against actual. According to Kareiva & Shigesada, (1983), if actual
# (approximately) matches expected, the trajectory is probably a correlated random walk
par(mar = c(5, 5, 0.1, 0.1) + .1)
plot(2:nrow(smoothed), sd2, type = 'l', pch = 16, cex = .2, lwd = 2,
     xlab = 'Number of consecutive moves',
     ylab = expression('Squared displacement, ' * R[n]^2))
lines(2:nrow(smoothed), ed2_1, col = "grey", lwd = 2)
lines(2:nrow(smoothed), ed2_2, col = "pink", lwd = 2)

legend("bottomright",
       c(expression("Actual displacement"^2),
         expression("Expected displacement"^2 * " (eqn 1)"),
         expression("Expected displacement"^2 * " (eqn 2)")),
       col = c('black', 'grey', 'pink'), lwd = 2,
       inset = c(0.01, 0.02))




