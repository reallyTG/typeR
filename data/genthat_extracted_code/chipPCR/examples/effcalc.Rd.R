library(chipPCR)


### Name: effcalc
### Title: Analysis of the amplification efficiency
### Aliases: effcalc effcalc.numeric effcalc.matrix effcalc.data.frame
###   effcalc,numeric,numeric-method effcalc,matrix,missing-method
###   effcalc,data.frame,missing-method
### Keywords: efficiency methods

### ** Examples

## Not run: 
# First Example
# Amplification efficiency plot 

require(MBmca)
par(mfrow = c(1,2), las = 0, bty = "n", cex.axis = 1.2, cex.lab = 1.2, 
    font = 2, cex.main = 1, oma = c(0.1, 0.1, 0.5, 0.1))

# Simulate a qPCR reaction with AmpSim for 45 cycles and some noise.
# Define number of cycles
cyc.no <- 45

# Create an empty plot
plot(NA, NA, xlim = c(1,cyc.no), ylim = c(0.01,1.1), xlab = "Cycles", 
     ylab = "Fluorescence", main = "")
mtext("A", cex = 2, side = 3, adj = 0, font = 2)

# Create a sequence of "whised" Cq value for the simulation
cycle <- rep(seq(15, 34, 3.5), 3)

# Define the levels for the decadic dilution with concentrations
# from 100 to 0.001 (six steps).
# The in-slico experiment is designed to have three replicates at
# six dilution steps.
dilution <-rep(c(100, 10, 1, 0.1, 0.01, 0.001), 3)

# Create an empty matrix for the results of the concentration
# dependent Cq values
ma.out <- matrix(data = NA, nrow = cyc.no, 
		 ncol = length(cycle))

# Use AmpSim to simulate amplification curves at different 
# concentrations. The simulation is performed with the addition
# of some noise. This will do a generation of unique amplification
# curves, even under idential paramter settings. Calculate the 
# pseudo Second Derivative Maximum (SDM) (Cq) by using the the 
# diffQ2 function from the MBmca package.

Cq.out <- vector()

for (i in 1:18) {
  ma.out[1:cyc.no, i] <- AmpSim(cyc = c(1:cyc.no), b.eff = -50, bl = 0.001, 
				ampl = 1, Cq = cycle[i], noise = TRUE, 
				nnl = 0.02)[, 2]
  lines(1:cyc.no, ma.out[, i])
  tmpP <- mcaSmoother(1:cyc.no, ma.out[, i])
  #TURNED OFF INDER - NEW COMPATIBILITY TO MBmca STILL PENDING
  Cq.tmp <- diffQ2(tmpP, inder = FALSE)$xTm1.2.D2[1]
  abline(v = Cq.tmp)
  Cq.out <- c(Cq.out, Cq.tmp)
}

# Assign the calculated Cqs to the corresponding concentrations
tmp <- data.frame(dilution[1:6],
		  Cq.out[1:6],
		  Cq.out[7:12],
		  Cq.out[13:18])
		  
# Determine the amplification efficiency by using the effcalc function
plot(effcalc(tmp[, 1], tmp[, 2:4]), CI = TRUE)
mtext("B", cex = 2, side = 3, adj = 0, font = 2) 
par(mfrow = c(1,1))
## End(Not run)



