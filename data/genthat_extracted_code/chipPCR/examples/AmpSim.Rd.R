library(chipPCR)


### Name: AmpSim
### Title: Amplification curve simulator
### Aliases: AmpSim
### Keywords: simulation amplification Richards qPCR

### ** Examples

# Example one
# Simulate a qPCR reaction with AmpSim for 40 cycles.
# Use an in-silico dilution of the template be adjusting 
# the Cq parameter. A change of 3.32 cycles corresponds 
# approximately to a 10-fold dilution.
par(mfrow = c(2,1))
plot(NA, NA, xlim = c(1,40), ylim = c(0.01,2), xlab = "Cycles", 
     ylab = "Fluorescence", main = "In-silco Dilution Experiment")
cycle.dilution <- seq(18, 35, 3.32)
for (i in 1:6) {
  lines(AmpSim(cyc = 1:40, b.eff = -25, bl = 0.01, ampl = 2, 
	      Cq = cycle.dilution[i]), type = "b", col = i, pch = 20)
}

# Example two
# Simulate a qPCR reaction with AmpSim for 40 cycles and some noise.
plot(NA, NA, xlim = c(1,40), ylim = c(0.01,2.2), xlab = "Cycles", 
     ylab = "Fluorescence", 
     main = "In-silco Dilution Experiment with Some Noise")
cycle.dilution <- seq(18, 35, 3.32)
for (i in 1:6) {
  lines(AmpSim(cyc = 1:40, b.eff = -25, bl = 0.01, ampl = 2, 
	      Cq = cycle.dilution[i], noise = TRUE, nnl = 0.05), 
	      type = "b", col = i, pch = 20)
}
par(mfrow = c(1,1))

# Example three
# Apply constant, increasing, decreasing nose to 
# amplification data.

par(mfrow = c(3,1))
method <- c("constant", "increase", "decrease")
for (j in 1:3){
    plot(NA, NA, xlim = c(1,40), ylim = c(0.02,2.2), xlab = "Cycles", 
	ylab = "Fluorescence", 
	main = paste("In-silco Dilution Experiment with noise method: ", 
					    method[j]))
    cycle.dilution <- seq(18, 35, 3.32)
    for (i in 1:6) {
      lines(AmpSim(cyc = 1:40, b.eff = -25, bl = 0.02, ampl = 2, 
		   Cq = cycle.dilution[i], noise = TRUE, nnl = 0.08, 
		   nnl.method = method[j]), type = "b", col = i, pch = 20)
   }
}
par(mfrow = c(1,1))



