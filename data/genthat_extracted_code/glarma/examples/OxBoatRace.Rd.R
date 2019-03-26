library(glarma)


### Name: OxBoatRace
### Title: Oxford-Cambridge Boat Race
### Aliases: OxBoatRace
### Keywords: datasets

### ** Examples

### Example with Oxford-Cambridge Boat Race
data(OxBoatRace)

y1 <- OxBoatRace$Camwin
n1 <- rep(1, length(OxBoatRace$Year))
Y <- cbind(y1, n1 - y1)
X <- cbind(OxBoatRace$Intercept, OxBoatRace$Diff)
colnames(X) <- c("Intercept", "Weight Diff")

oxcamglm <- glm(Y ~ Diff + I(Diff^2),
                data = OxBoatRace,
                family = binomial(link = "logit"), x = TRUE)
summary(oxcamglm)

X <- oxcamglm$x

glarmamod <- glarma(Y, X, thetaLags = c(1, 2), type = "Bin", method = "NR",
                    residuals = "Pearson", maxit = 100, grad = 1e-6)

summary(glarmamod)
likTests(glarmamod)

## Plot Probability of Cambridge win versus Cambridge Weight advantage:
beta <- coef(glarmamod, "beta")
par(mfrow = c(1, 1))
plot(OxBoatRace$Diff, 1 / (1 + exp(-(beta[1] + beta[2] * OxBoatRace$Diff +
                                       beta[3] * OxBoatRace$Diff^2))),
     ylab = "Prob", xlab = "Weight Diff")
title("Probability of Cambridge win \n versus Cambridge weight advantage")

## Residuals and fit plots
par(mfrow=c(3, 2))
plot.glarma(glarmamod)



