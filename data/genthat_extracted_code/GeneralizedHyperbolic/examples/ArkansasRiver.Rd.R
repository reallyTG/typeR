library(GeneralizedHyperbolic)


### Name: ArkansasRiver
### Title: Soil Electrical Conductivity
### Aliases: ArkansasRiver
### Keywords: datasets

### ** Examples

data(ArkansasRiver)
lapply(ArkansasRiver, summary)
upstream <- ArkansasRiver[[1]]
downstream <- ArkansasRiver[[2]]
## Fit normal inverse Gaussian
## Hyperbolic can also be fitted but fit is not as good
fitUpstream <- nigFit(upstream)
summary(fitUpstream)
par(mfrow = c(2,2))
plot(fitUpstream)
fitDownstream <- nigFit(downstream)
summary(fitDownstream)
plot(fitDownstream)
par(mfrow = c(1,1))
## Combined plot to compare
## Reproduces Figure 3 from Morway and Gates (2011)
hist(upstream, col = "grey", xlab = "", ylab = "", cex.axis = 1.25,
     main = "", breaks = seq(0,20, by = 1), xlim = c(0,15), las = 1,
     ylim = c(0,0.5), freq = FALSE)
param <- coef(fitUpstream)
nigDens <- function(x) dnig(x, param = param)
curve(nigDens, 0, 15, n = 201, add = TRUE,
      ylab = NULL, col = "red", lty = 1, lwd = 1.7)

hist(downstream, add = TRUE, col = "black", angle = 45, density = 15,
     breaks = seq(0,20, by = 1), freq = FALSE)
param <- coef(fitDownstream)
nigDens <- function(x) dnig(x, param = param)
curve(nigDens, 0, 15, n = 201, add = TRUE,
      ylab = NULL, col = "red", lty = 1, lwd = 1.7)

mtext(expression(EC[e]), side = 1, line = 3, cex = 1.25)
mtext("Frequency", side = 2, line = 3, cex = 1.25)
legend(x = 7.5, y = 0.250, c("Upstream Region","Downstream Region"),
       col = c("black","black"), density = c(NA,25),
       fill = c("grey","black"), angle = c(NA,45),
       cex = 1.25, bty = "n", xpd = TRUE)



