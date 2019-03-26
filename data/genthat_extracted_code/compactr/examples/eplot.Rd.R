library(compactr)


### Name: eplot
### Title: Create an empty plot with compact axis notation
### Aliases: eplot

### ** Examples

### Plot 0: illustrating the purpose

# run these lines one at a time to see what happens
par(mfrow = c(2,2))
eplot(xlim = c(-1, 1), ylim = c(0, 10))
aplot(main = "Hey Look! No axis labels.")
aplot(main = "But this one has them?!")
aplot(main = "And this one does just what you'd expect!")
# after a call to eplot() or aplot(), I just add
# whatever I want to the plot.


### Plot 1: a simple scatter plot

set.seed(1234)
x <- rnorm(100)
y <- x + rnorm(100)

par(mfrow = c(1,1), mar = c(3,3,1,1), oma = c(0,0,2,0))
eplot(xlim = c(min(x), max(x)), ylim = c(min(y), max(y)),
           xlab = "Explanatory Variable", ylab = "Outcome Variable")
points(x, y)
abline(lm(y ~ x), lwd = 3, col = "red")
mtext("A Clever Title", outer = TRUE)


### Plot 2: a matrix of scatter plots

# simulation multilevel data
set.seed(1234)
group <- rep(1:11, each = 15)
a <- rnorm(length(unique(group)), sd = 1)
b <- rnorm(length(unique(group)), mean = 1, sd = .3)
x <- rnorm(length(group))
y <- a[group] + x*b[group] + rnorm(length(group))

## estimate random effects models and pull out the estimates
#library(lme4)
#hier <- lmer(y ~ x + (1 + x | group))
#a.hat <- fixef(hier)[1] + ranef(hier)$group[, 1]
#b.hat <- fixef(hier)[2] + ranef(hier)$group[, 2]

# draw plot
par(mfrow = c(3,4), mar = c(.75,.75,.75,.75), oma = c(4,4,4,1))
for (i in 1:11) {
  eplot(xlim = c(min(x), max(x)), ylim = c(min(y), max(y)),
             xlab = "Explanatory Variable", ylab = "Outcome Variable",
             main = paste("Group", i))
  points(x[group == i], y[group == i])
  #abline(a = a.hat[i], b = b.hat[i])
  abline(lm(y[group == i] ~ x[group == i]), lty = 3)
}

# add an overall title
mtext("Comparing Partial Pooling and No Pooling", outer = TRUE, line = 2)


### Plot 3: a matrix of scatter plots using aplot() and addxaxis()

# use the same estimates as before

# draw the first plot with eplot()
par(mfrow = c(3,4), mar = c(.75,.75,.75,.75), oma = c(4,4,4,1))
eplot(xlim = c(min(x), max(x)), ylim = c(min(y), max(y)),
           xlab = "Explanatory Variable", ylab = "Outcome Variable",
           main = "Group 1")

# then add stuff
points(x[group == 1], y[group == 1])
#abline(a = a.hat[1], b = b.hat[1])
abline(lm(y[group == 1] ~ x[group == 1]), lty = 3)
legend(par("usr")[1], par("usr")[4],
       legend = c("partial pooling", "no pooling"), lty = c(1, 3),
       bty = "n", bg = NA, cex = .8)

# draw the rest with aplot()
for (i in 2:11) {
  aplot(main = paste("Group", i))
  # since we don't plan to have bottom right plot,
  # let's add an axis to the one above
  if (i == 9) { addxaxis() }
  points(x[group == i], y[group == i])
  #abline(a = a.hat[i], b = b.hat[i])
  abline(lm(y[group == i] ~ x[group == i]), lty = 3)
}
mtext("Comparing Partial Pooling and No Pooling", outer = TRUE, line = 2)



