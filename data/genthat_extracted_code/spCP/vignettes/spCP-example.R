## ---- echo = FALSE-------------------------------------------------------
###Start with a clean space
# rm(list = ls())

###Take care of some stuff that I don't want the user to see...
# path.package <- "/Users/Sam/Desktop/spCP/"
# suppressMessages(devtools::load_all(path.package)) #loads scripts
# suppressMessages(devtools::document(path.package)) #creates documentation
###Make sure to remove devtools from Suggests line in DESCRIPTION before submission

## ------------------------------------------------------------------------
library(womblR)
library(spCP)

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
M <- dim(W)[1] # number of locations

## ------------------------------------------------------------------------
DM <- GarwayHeath[-blind_spot] # Garway-Heath angles

## ---- fig.align="center", fig.width = 5.5, fig.height = 5.5--------------
PlotAdjacency(W = W, DM = DM, zlim = c(0, 180), Visit = NA, 
              main = "Garway-Heath dissimilarity metric\n across the visual field")

## ------------------------------------------------------------------------
pdist <- function(x, y) pmin(abs(x - y), (360 - pmax(x, y) + pmin(x, y))) #Dissimilarity metric distance function (i.e., circumference)
DM_Matrix <- matrix(nrow = M, ncol = M)
for (i in 1:M) {
  for (j in 1:M) {
    DM_Matrix[i, j] <- pdist(DM[i], DM[j])
  }
}
BAlpha <- -log(0.5) / min(DM_Matrix[DM_Matrix > 0])
AAlpha <- 0

## ------------------------------------------------------------------------
Hypers <- list(Alpha = list(AAlpha = AAlpha, BAlpha = BAlpha),
               Sigma = list(Xi = 6, Psi = diag(5)),
               Delta = list(Kappa2 = 1000))

## ------------------------------------------------------------------------
Starting <- list(Sigma = 0.01 * diag(5),
                 Alpha = mean(c(AAlpha, BAlpha)),
                 Delta = c(0, 0, 0, 0, 0))

## ------------------------------------------------------------------------
Tuning <- list(Lambda0Vec = rep(1, M),
               Lambda1Vec = rep(1, M),
               EtaVec = rep(1, M),
               Alpha = 1)

## ------------------------------------------------------------------------
MCMC <- list(NBurn = 1000, NSims = 1000, NThin = 2, NPilot = 5)

## ---- include = FALSE----------------------------------------------------
reg.spCP <- spCP(Y = Y, DM = DM, W = W, Time = Time, Starting = Starting, Hypers = Hypers, Tuning = Tuning, MCMC = MCMC)

## ---- eval = FALSE-------------------------------------------------------
#  reg.spCP <- spCP(Y = Y, DM = DM, W = W, Time = Time,
#                   Starting = Starting, Hypers = Hypers, Tuning = Tuning, MCMC = MCMC,
#                   Family = "tobit",
#                   Weights = "continuous",
#                   Distance = "circumference",
#                   Rho = 0.99,
#                   ScaleY = 10,
#                   ScaleDM = 100,
#                   Seed = 54)
#  
#  ## Burn-in progress:  |*************************************************|
#  ## Sampler progress:  0%..  10%..  20%..  30%..  40%..  50%..  60%..  70%..  80%..  90%..  100%..

## ------------------------------------------------------------------------
names(reg.spCP)

## ------------------------------------------------------------------------
library(coda)

## ------------------------------------------------------------------------
Alpha <- as.mcmc(reg.spCP$alpha)

## ---- fig.width = 5.2, fig.height = 5.2, echo = FALSE--------------------
par(mfrow = c(1, 1))
traceplot(Alpha, ylab = expression(alpha), main = expression(paste("Posterior" ~ alpha)))

## ---- echo = FALSE-------------------------------------------------------
geweke.diag(Alpha)$z

## ---- echo = TRUE, fig.width = 5.2, fig.height = 5.2---------------------
VFSeries$TimeYears <- VFSeries$Time / 365
PlotCP(reg.spCP, VFSeries, dls = "DLS", time = "TimeYears", location = "Location", cp.line = TRUE, cp.ci = TRUE)

## ------------------------------------------------------------------------
Diags <- spCP::diagnostics(reg.spCP, diags = c("dic", "dinf", "waic"), keepDeviance = TRUE)

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
Nu <- length(Time) # calculate number of visits
NewTimes <- Time[Nu] + c(50, 100) / 365

## ------------------------------------------------------------------------
Predictions <- predict(reg.spCP, NewTimes)

## ------------------------------------------------------------------------
names(Predictions)

## ---- fig.align = 'center', fig.width = 4.5, fig.height = 4.5------------
CPProbs <- apply(reg.spCP$eta, 2, function(x) mean(x < Time[Nu]))
PlotSensitivity(Y = CPProbs,
                main = "Probability of an observed \n change point",
                legend.lab = expression(paste("Pr[", eta, "(s)] < ", t)), legend.round = 2,
                bins = 250, border = FALSE)

