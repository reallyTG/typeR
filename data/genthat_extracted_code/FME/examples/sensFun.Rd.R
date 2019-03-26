library(FME)


### Name: sensFun
### Title: Local Sensitivity Analysis
### Aliases: sensFun summary.sensFun plot.sensFun plot.summary.sensFun
###   pairs.sensFun
### Keywords: utilities

### ** Examples

## =======================================================================
## Bacterial growth model as in Soetaert and Herman, 2009
## =======================================================================
pars <- list(gmax = 0.5, eff = 0.5,
              ks = 0.5, rB = 0.01, dB = 0.01)

solveBact <- function(pars) {
  derivs <- function(t, state, pars) { # returns rate of change
    with (as.list(c(state, pars)), {
      dBact <-  gmax * eff * Sub/(Sub + ks) * Bact - dB * Bact - rB * Bact
      dSub  <- -gmax       * Sub/(Sub + ks) * Bact + dB * Bact
      return(list(c(dBact, dSub)))
    })
  }
  state   <- c(Bact = 0.1, Sub = 100)
  tout    <- seq(0, 50, by = 0.5)
  ## ode solves the model by integration ...
  return(as.data.frame(ode(y = state, times = tout, func = derivs,
    parms = pars)))
}

out <- solveBact(pars)

plot(out$time, out$Bact, ylim = range(c(out$Bact, out$Sub)),
     xlab = "time, hour", ylab = "molC/m3", type = "l", lwd = 2)
lines(out$time, out$Sub, lty = 2, lwd = 2)
lines(out$time, out$Sub + out$Bact)

legend("topright", c("Bacteria", "Glucose", "TOC"),
       lty = c(1, 2, 1), lwd = c(2, 2, 1))

## sensitivity functions
SnsBact <- sensFun(func = solveBact, parms = pars,
                   sensvar = "Bact", varscale = 1)
head(SnsBact)
plot(SnsBact)
plot(SnsBact, type = "b", pch = 15:19, col = 2:6, 
     main = "Sensitivity all vars")

summary(SnsBact)
plot(summary(SnsBact))

SF <- sensFun(func = solveBact, parms = pars,
             sensvar = c("Bact", "Sub"), varscale = 1)
head(SF)
tail(SF)

summary(SF, var = TRUE)

plot(SF)
plot(SF, which = c("Sub","Bact"))
pm <- par(mfrow = c(1,3))
plot(SF, which = c("Sub", "Bact"), mfrow = NULL)
plot(SF, mfrow = NULL)
par(mfrow = pm)

## Bivariate sensitivity
pairs(SF)  # same color
pairs(SF, which = "Bact", col = "green", pch = 15)
pairs(SF, which = c("Bact", "Sub"), col = c("green", "blue"))
mtext(outer = TRUE, side = 3, line = -2,
      "Sensitivity functions", cex = 1.5)

## pairwise correlation
cor(SnsBact[,-(1:2)])




