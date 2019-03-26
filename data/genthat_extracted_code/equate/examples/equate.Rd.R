library(equate)


### Name: equate
### Title: Observed Score Linking and Equating
### Aliases: equate equate.list equate.freqtab equate.default
###   summary.equate summary.equate.list
### Keywords: methods

### ** Examples


# See vignette("equatevignette") and Albano (2016) for a
# description of methods and additional examples

# Random groups equating for (1) identity, (2) mean, 
# (3) linear, (4) equipercentile with loglinear
# smoothing, and (5) a composite of mean and identity
rx <- as.freqtab(ACTmath[, 1:2])
ry <- as.freqtab(ACTmath[, c(1, 3)])
set.seed(2007)

req1 <- equate(rx, ry, type = "i", boot = TRUE, reps = 5)
req2 <- equate(rx, ry, type = "m", boot = TRUE, reps = 5)
req3 <- equate(rx, ry, type = "l", boot = TRUE, reps = 5)
req4 <- equate(rx, ry, type = "e", boot = TRUE, reps = 5,
  smooth = "loglin", degree = 3)
req5 <- composite(list(req1, req2), wc = .5, symmetric = TRUE)

# Compare equating functions
plot(req1, req2, req3, req4, req5[[1]], addident = FALSE)

# Compare boostrap standard errors
# Bootstrapping isn't supported for composite equating
plot(req1, req2, req3, req4, addident = FALSE, out = "se",
  legendplace = "topleft")

# Nonequivalent groups design for (1) Tucker linear,
# (2) frequency estimation , and (3) Braun/Holland linear
nx <- freqtab(KBneat$x, scales = list(0:36, 0:12))
ny <- freqtab(KBneat$y, scales = list(0:36, 0:12))

neq1 <- equate(nx, ny, type = "linear", method = "tuck", ws = 1)
neq2 <- equate(nx, ny, type = "equip", method = "freq", ws = 1)
neq3 <- equate(nx, ny, type = "linear", method = "braun", ws = 1)

# Compare equated scores
round(cbind(xscale = 0:36, tucker = neq1$conc$yx,
	fe = neq2$conc$yx, braun = neq3$conc$yx), 2)

# Multiple linkings using PISA reading booklet 6
# clusters 3a, 5, 6, and 7
r3 <- freqtab(PISA$totals$b6$r3a, scales = 0:15)
r5 <- freqtab(PISA$totals$b6$r5, scales = 0:15)
r6 <- freqtab(PISA$totals$b6$r6, scales = 0:15)
r7 <- freqtab(PISA$totals$b6$r7, scales = 0:14)
eqargs <- list(r3r5 = list(type = "linear", x = "r3", y = "r5",
    name = "Linear Linking PISA r3 to r5"),
  r5r6 = list(type = "linear", x = "r5", y = "r6",
    name = "Linear Linking PISA r5 to r6"),
  r6r7 = list(type = "linear", x = "r6", y = "r7",
    name = "Linear Linking PISA r5 to r7"))
req <- equate(list(r3 = r3, r5 = r5, r6 = r6, r7 = r7), eqargs)

# Put PISA r3 on the scale of r7 using the linking chain
# Compare to a direct linking of r3 to r7
equate(equate(req$r3r5$conc$yx, req$r5r6), req$r6r7)
equate(r3, r7, "linear")$conc$yx

# Linking PISA cluster r3a to r5 with multiple anchors
m367 <- freqtab(PISA$totals$b6[1:198, c("r3a", "r6", "r7")],
	scales = list(0:15, 0:16, 0:14))
m567 <- freqtab(PISA$totals$b6[199:396, c("r5", "r6", "r7")],
	scales = list(0:15, 0:16, 0:14))
meq1 <- equate(m367, m567, type = "mean", method = "nom")
meq2 <- equate(m367, m567, type = "mean", method = "tuck")
meq3 <- equate(m367, m567, type = "lin", method = "tuck")
meq4 <- equate(m367, m567, type = "equip", method = "freq",
	smooth = "log", show = FALSE)
meq <- equate(m367, m567, type = "mean", method = "nom")
plot(meq1, meq2, meq3, meq4, meq, req[[1]])




