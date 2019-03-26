library(equate)


### Name: bootstrap
### Title: Bootstrap Equating Error
### Aliases: bootstrap bootstrap.default bootstrap.equate bootstrap.freqtab
###   summary.bootstrap
### Keywords: methods

### ** Examples


# Parametric bootstrapping using smoothed
# frequency distributions
set.seed(111213)
x <- freqtab(KBneat$x, scales = list(0:36, 0:12))
y <- freqtab(KBneat$y, scales = list(0:36, 0:12))
xp <- loglinear(x, asfreqtab = TRUE)
yp <- loglinear(y, asfreqtab = TRUE)
crit <- equate(xp, yp, "e", "c")$conc$yx
eqargs <- list(m.t = list(type = "m", method = "t"),
  l.t = list(type = "l", method = "t"))
bootout1 <- bootstrap(x = x, y = y, xn = 20, yn = 20,
  crit = crit, args = eqargs, reps = 30)
plot(bootout1, out = "rmse", legendplace = "top",
  addident = FALSE)

# Bootstraps for an existing equating
eq <- equate(x, y, type = "m", method = "t")
bootout2 <- bootstrap(eq, xn = 100, yn = 100,
  crit = crit, reps = 20)
summary(bootout2)




