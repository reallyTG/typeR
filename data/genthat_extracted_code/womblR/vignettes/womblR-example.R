## ---- echo = FALSE-------------------------------------------------------
###Start with a clean space
# rm(list = ls())

###Take care of some stuff that I don't want the user to see...
# path.package <- "/Users/Sam/Documents/Sam/School/Dissertation/Packages/womblR/"
# suppressMessages(devtools::load_all(path.package)) #loads scripts
# suppressMessages(devtools::document(path.package)) #creates documentation
###Make sure to remove devtools from Suggests line in DESCRIPTION before submission

## ------------------------------------------------------------------------
library(womblR)

## ------------------------------------------------------------------------
head(VFSeries)

## ---- fig.align="center", fig.width = 5.5, fig.height = 5.5--------------
PlotVfTimeSeries(Y = VFSeries$DLS,
                 Location = VFSeries$Location,
                 Time = VFSeries$Time,
                 main = "Visual field sensitivity time series \n at each location",
                 xlab = "Days from baseline visit",
                 ylab = "Differential light sensitivity (dB)",
                 line.col = 1, line.type = 1, line.reg = FALSE)

## ------------------------------------------------------------------------
blind_spot <- c(26, 35) # define blind spot
VFSeries <- VFSeries[order(VFSeries$Location), ] # sort by location
VFSeries <- VFSeries[order(VFSeries$Visit), ] # sort by visit
VFSeries <- VFSeries[!VFSeries$Location %in% blind_spot, ] # remove blind spot locations
Y <- VFSeries$DLS # define observed outcome data

## ------------------------------------------------------------------------
Time <- unique(VFSeries$Time) / 365 # years since baseline visit
print(Time)

## ------------------------------------------------------------------------
W <- HFAII_Queen[-blind_spot, -blind_spot] # visual field adjacency matrix

## ------------------------------------------------------------------------
DM <- GarwayHeath[-blind_spot] # Garway-Heath angles

## ---- fig.align="center", fig.width = 5.5, fig.height = 5.5--------------
PlotAdjacency(W = W, DM = DM, zlim = c(0, 180), Visit = NA, 
              main = "Garway-Heath dissimilarity metric\n across the visual field")

## ------------------------------------------------------------------------
TimeDist <- abs(outer(Time, Time, "-"))
TimeDistVec <- TimeDist[lower.tri(TimeDist)]
minDiff <- min(TimeDistVec)
maxDiff <- max(TimeDistVec)
PhiUpper <- -log(0.01) / minDiff # shortest diff goes down to 1%
PhiLower <- -log(0.95) / maxDiff # longest diff goes up to 95%

## ------------------------------------------------------------------------
Hypers <- list(Delta = list(MuDelta = c(3, 0, 0), OmegaDelta = diag(c(1000, 1000, 1))),
               T = list(Xi = 4, Psi = diag(3)),
               Phi = list(APhi = PhiLower, BPhi = PhiUpper))

## ------------------------------------------------------------------------
Starting <- list(Delta = c(3, 0, 0), T = diag(3), Phi = 0.5)

## ------------------------------------------------------------------------
Nu <- length(Time) # calculate number of visits
Tuning <- list(Theta2 = rep(1, Nu), Theta3 = rep(1, Nu), Phi = 1)

## ------------------------------------------------------------------------
MCMC <- list(NBurn = 10000, NSims = 10000, NThin = 10, NPilot = 20)

## ---- include = FALSE----------------------------------------------------
reg.STBDwDM <- STBDwDM(Y = Y, DM = DM, W = W, Time = Time, Starting = Starting, Hypers = Hypers, Tuning = Tuning, MCMC = MCMC)

## ---- eval = FALSE-------------------------------------------------------
#  reg.STBDwDM <- STBDwDM(Y = Y, DM = DM, W = W, Time = Time,
#                         Starting = Starting, Hypers = Hypers, Tuning = Tuning, MCMC = MCMC,
#                         Family = "tobit",
#                         TemporalStructure = "exponential",
#                         Distance = "circumference",
#                         Weights = "continuous",
#                         Rho = 0.99,
#                         ScaleY = 10,
#                         ScaleDM = 100,
#                         Seed = 54)
#  ## Burn-in progress:  |*************************************************|
#  ## Sampler progress:  0%..  10%..  20%..  30%..  40%..  50%..  60%..  70%..  80%..  90%..  100%..

## ------------------------------------------------------------------------
names(reg.STBDwDM)

## ------------------------------------------------------------------------
library(coda)

## ------------------------------------------------------------------------
Mu <- as.mcmc(reg.STBDwDM$mu)
Tau2 <- as.mcmc(reg.STBDwDM$tau2)
Alpha <- as.mcmc(reg.STBDwDM$alpha)
Delta <- as.mcmc(reg.STBDwDM$delta)
T <- as.mcmc(reg.STBDwDM$T)
Phi <- as.mcmc(reg.STBDwDM$phi)

## ---- fig.width = 7.18, fig.height = 5.2, echo = FALSE-------------------
par(mfrow = c(2, 3))
traceplot(Mu[, 1], ylab = expression(mu[1]), main = expression(paste("Posterior of " ~ mu[1])))
traceplot(Tau2[, 1], ylab = expression(tau[1]^2), main = expression(paste("Posterior of " ~ tau[1]^2)))
traceplot(Alpha[, 1], ylab = expression(alpha[1]), main = expression(paste("Posterior of " ~ alpha[1])))
traceplot(Delta[, 1], ylab = expression(delta[1]), main = expression(paste("Posterior of " ~ delta[1])))
traceplot(T[, 1], ylab = expression(paste(T['1,1'])), main = expression(paste("Posterior of " ~ T['1,1'])))
traceplot(Phi, ylab = expression(phi), main = expression(paste("Posterior" ~ phi)))

## ---- echo = FALSE-------------------------------------------------------
c(geweke.diag(Mu)$z[1], geweke.diag(Tau2)$z[1], geweke.diag(Alpha)$z[1],geweke.diag(Delta)$z[1], geweke.diag(T)$z[1],geweke.diag(Phi)$z)

## ---- echo = FALSE, fig.width = 7.18, fig.height = 2.6-------------------
Xlab = "Days from baseline visit"
X = Time * 365 
par(mfcol = c(1, 3))
plot(X, apply(Mu, 2, mean), main = expression(paste("Posterior mean of ",mu," over time")), ylab = expression(mu), xlab = Xlab)
plot(X, apply(Tau2, 2, mean), main = expression(paste("Posterior mean of ",tau^2," over time")), ylab = expression(tau^2), xlab = Xlab)
plot(X, apply(Alpha, 2, mean), main = expression(paste("Posterior mean of ",alpha," over time")), ylab = expression(alpha), xlab = Xlab) 

## ------------------------------------------------------------------------
CVAlpha <- apply(Alpha, 1, cv <- function(x) sd(x) / mean(x))
STCV <- c(mean(CVAlpha), sd(CVAlpha), quantile(CVAlpha, probs = c(0.025, 0.975)))
names(STCV)[1:2] <- c("Mean", "SD")
print(STCV)

## ------------------------------------------------------------------------
Wij <- PosteriorAdj(reg.STBDwDM)

## ------------------------------------------------------------------------
Wij[1:6, 1:7]

## ---- fig.align="center", fig.width = 4.5, fig.height = 4.5--------------
ColorScheme1 <- c("Black", "#636363", "#bdbdbd", "#f0f0f0", "White")
PlotAdjacency(Wij, Visit = 3, stat = "mean", 
              main = "Posterior mean adjacencies at \n visit 3 across the visual field", 
              color.scheme = ColorScheme1)

## ---- fig.align="center", fig.width = 4.5, fig.height = 4.5--------------
ColorScheme2 <- rev(ColorScheme1)
zlimSD <- quantile(Wij[,c(5,7,9,11,13,15,17,19,21)], probs = c(0, 1))
PlotAdjacency(Wij, Visit = 4, stat = "sd", 
              main = "Posterior SD of adjacencies at \n visit 4 across the visual field", 
              zlim = zlimSD, color.scheme = ColorScheme2)

## ------------------------------------------------------------------------
Diags <- diagnostics(reg.STBDwDM, diags = c("dic", "dinf", "waic"), keepDeviance = TRUE)

## ---- fig.align = 'center', fig.width = 4, fig.height = 3.3--------------
Deviance <- as.mcmc(Diags$deviance)
traceplot(Deviance, ylab = "Deviance", main = "Posterior Deviance")

## ---- eval = FALSE-------------------------------------------------------
#  print(Diags)

## ---- echo = FALSE-------------------------------------------------------
unlist(Diags$dic)
unlist(Diags$dinf)
unlist(Diags$waic)

## ------------------------------------------------------------------------
NewTimes <- Time[Nu] + c(50, 100) / 365

## ------------------------------------------------------------------------
Predictions <- predict(reg.STBDwDM, NewTimes)

## ------------------------------------------------------------------------
names(Predictions)

## ------------------------------------------------------------------------
names(Predictions$MuTauAlpha)
head(Predictions$MuTauAlpha$alpha)

## ------------------------------------------------------------------------
names(Predictions$Y)

## ---- fig.align = 'center', fig.width = 5.5, fig.height = 5.5------------
PlotSensitivity(Y = apply(Predictions$Y$y10, 2, median),
                main = "Sensitivity estimate (dB) at each \n location on visual field",
                legend.lab = "DLS (dB)", legend.round = 2,
                bins = 250, border = FALSE)

