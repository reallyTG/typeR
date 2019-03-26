library(enaR)


### Name: enaUncertainty
### Title: Produce a set of plausible network models
### Aliases: enaUncertainty

### ** Examples


rm(list = ls())
library(enaR)

# === INPUT ===

# load model for analysis
data(troModels)
m <- troModels[[6]] # cone sping model (Kay et al. 1989; from Tilly)

# Set Uncertainty Analysis parameters
no.samples = 150 # the number of plausible models to return (number of samples); 
                 # 10,000 would be better.
f.error = 25   # flow parameters percent error to investigate

# === ACTION ===

# peform uncertainty analysis
m.uncertainty.list <- enaUncertainty(m,                     # original model
                                     type = "percent",      # type of uncertainty to use
                                    p.err = f.error,       # define percent error
                                     iter = no.samples )    # specify the number of samples

# apply selected ENA
ns <- lapply(m.uncertainty.list, get.ns) # get ENA whole network statstics (metrics, indicators)
ns <- as.data.frame(do.call(rbind, ns))

ns.original <- as.data.frame(get.ns(m))

# === OUTPUT ===

# lets see how the uncertainty in model flows changed the model inputs and total system throughflow.
opar <- par(las = 1, mfcol = c(2,1))
hist(ns$Boundary, col = "steelblue", border = "white", main = "Total Boundary Input")
abline(v = ns.original$Boundary, col = "orange", lwd = 2)
hist(ns$TST, col = "blue2", border = "white", main = "Total System ThroughFLOW")
abline(v = ns.original$TST, col = "orange", lwd = 2)
rm(opar)

# Lets use the 95% CI to make statisitcal inferences about the
# hypothesized "dominance of indirect effects" (Higashi and Patten
# 1991, Salas and Borrett 2010, Borrett et al. 2016), and "network
# homogenization" (Fath and Patten 1999, Borrett and Salas 2010,
# Borrett et al. 2016)

# find 95% confidence intervals
id.95ci <- quantile(ns$ID.F, probs = c(0.025, 0.975))
hmg.95ci <- quantile(ns$HMG.O, probs = c(0.025, 0.975))

# barplot of the calculated values for the original model
opar <- par(las = 1)
bp <- barplot(c(ns.original$ID.F, ns.original$HMG.O),
          ylim = c(0,3),
          col = "grey",
              border = NA,
              names.arg = c("Indirect/Direct", "Homogenization"))
abline(h = 1, col = "orange", lwd = 1.5) # threshold value

# add 95CI error bars from Uncertainty Analysis
arrows(bp, c(id.95ci[1], hmg.95ci[1]),
      bp, c(id.95ci[2], hmg.95ci[2]),
      code = 3, lwd = 1.5, angle = 90, length = 0.2, col = "black")

# === OUTPUT ===

# lets see how the uncertainty in model flows changed the model inputs and total system throughflow.
opar <- par(las = 1, mfcol = c(2,1))
hist(ns$Boundary, col = "steelblue", border = "white", main = "Total Boundary Input")
abline(v = ns.original$Boundary, col = "orange", lwd = 2)
hist(ns$TST, col = "blue2", border = "white", main = "Total System ThroughFLOW")
abline(v = ns.original$TST, col = "orange", lwd = 2)
rm(opar)

# Lets use the 95% CI to make statisitcal inferences about the
# hypothesized "dominance of indirect effects" (Higashi and Patten
# 1991, Salas and Borrett 2010, Borrett et al. 2016), and "network
# homogenization" (Fath and Patten 1999, Borrett and Salas 2010,
# Borrett et al. 2016)

# find 95% confidence intervals
id.95ci <- quantile(ns$ID.F, probs = c(0.025, 0.975))
hmg.95ci <- quantile(ns$HMG.O, probs = c(0.025, 0.975))

opar <- par(las = 1)
bp <- barplot(c(ns.original$ID.F, ns.original$HMG.O),
         ylim = c(0,3),
         col = "grey",
             border = NA,
             names.arg = c("Indirect/Direct", "Homogenization"))
abline(h = 1, col = "orange", lwd = 1.5) # threshold value

# add 95CI error bars from Uncertainty Analysis
arrows(bp, c(id.95ci[1], hmg.95ci[1]),
       bp, c(id.95ci[2], hmg.95ci[2]),
       code = 3, lwd = 1.5, angle = 90, length = 0.2, col = "black")

# The results show that the orignial value of the Indirect-to-Direct
# flows ratio is larger than one, indicating the "dominance of
# indirect effects"; however, the 95% confidence interval for this
# indicator with a 25% uniform uncertainty spans the threshold value
# of 1 (ranging from 0.9 to 1.16).  Thus, we are not confident that
# this parameter exceeds the interpretation threshold given this
# level of uncertainty.  In contast, the network homogenizaiton
# pameter exceeds the interpretation threshold of 1.0, and the 95% CI
# for our level of uncertainty suggests that we are confident that
# this interpretation is correct.

hist(ns$TST, col = "blue")




