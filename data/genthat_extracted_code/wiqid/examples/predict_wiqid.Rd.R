library(wiqid)


### Name: predict.wiqid
### Title: Predict method for objects of class 'wiqid'
### Aliases: predict.wiqid
### Keywords: predict methods

### ** Examples

# Generate some simulated occupancy data for 300 sites:
set.seed(2017)
original.data <- data.frame(
  elev = runif(300, 0, 1000),
  forType = factor(sample(c("dry", "swamp", "mangrove"), size=300, replace=TRUE, prob=3:1)))
modMat <- model.matrix( ~ elev + forType, data = original.data)
psiCoef <- c(3, -0.003, -3, -1) # declines with 'elev'; highest for 'dry', lowest 'mangrove'
psi <- plogis(modMat %*% psiCoef)
hist(psi, breaks=20)
z <- rbinom(300, 1, psi)
mean(z)  # true realized occupancy
# detection history for 3 replicates, constant p = 0.6:
DH <- matrix(rbinom(300*3, 1, 0.6*z), nrow=300)
# fit models
m0 <- occSS(DH)
mE <- occSS(DH, psi ~ elev, data = original.data)
mEF <- occSS(DH, psi ~ elev + forType, data = original.data)

# now try predictions:
newdata <- expand.grid(elev=c(200, 500, 800), forType=c("dry", "swamp"))
predict(mEF, newdata, "psi")
cbind(newdata, predict(mEF, newdata, "psi", type='res'))
cbind(newdata, predict(mE, newdata, "psi", type='res'))
cbind(newdata, predict(m0, newdata, "psi", type='res'))

# do a nice plot
xx <- seq(0, 1000, length=51)
plotdata <- expand.grid(elev=xx, forType=c("dry", "swamp", "mangrove"))
toPlot <- predict(mEF, plotdata, "psi", type='res')
plot(xx, rep(0.5, 51), type='n', las=1, ylim=range(toPlot),
  xlab="Elevation", ylab="Occupancy probability")
ciCols <- adjustcolor(c('lightgreen', 'skyblue', 'pink'), 0.5)
estCols <- c('darkgreen', 'blue', 'red')
for(i in 1:3) {
  this1 <- toPlot[plotdata$forType == levels(plotdata$forType)[i], ]
  polygon(c(xx, rev(xx)), c(this1[, 3], rev(this1[, 4])), col=ciCols[i])
  lines(xx, this1[, 1], col=estCols[i])
}
legend('topright', levels(plotdata$forType), lty=1, col=estCols, bty='n')

# Add a survey-level covariate: observer ID with different detection probabilities
observer <- c(sample(1:2, size=300, replace=TRUE),  # A and B on first survey occasion
              sample(1:3, size=300, replace=TRUE),  # A, B and C for second
              sample(2:3, size=300, replace=TRUE))  # only B and C for third
obsID <- matrix(LETTERS[observer], nrow=300)
colnames(obsID) <- c("obs1", "obs2", "obs3")
original.data <- cbind(original.data, as.data.frame(obsID))
str(original.data)
p <- c(0.4, 0.6, 0.8)[observer]
DH <- matrix(rbinom(300*3, 1, p*z), nrow=300)
mEFO <- occSS(DH, list(psi ~ elev + forType, p ~ obs), data = original.data)
# Check the categorical covariate names and levels:
mEFO$xlev
predict(mEFO, data.frame(obs=c("A", "B", "C")), "p")
predict(mEFO, data.frame(obs=c("A", "B", "C")), "p", type="resp")




