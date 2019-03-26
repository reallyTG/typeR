library(SpecHelpers)


### Name: plotNMRspec
### Title: Create and Plot an NMR Spectrum
### Aliases: plotNMRspec
### Keywords: utilities

### ** Examples


### A simulated 1H NMR spectrum

peaks1 <- data.frame(
	delta = c(1.3, 3.75, 3.9, 10.2),
	mult = c(3, 4, 2, 1),
	J = c(14, 14, 14, 0),
	area = c(3, 2, 1, 1),
	pw = c(2, 2, 2, 10))

res <- plotNMRspec(peaks1, x.range = c(12, 0), MHz = 500,
	main = "500 MHz Simulated 1H NMR Spectrum")

### Compare to the same data at 200 MHz and plot together

par(mfrow = c(2,1))
res <- plotNMRspec(peaks1, x.range = c(12, 0), MHz = 500,
	main = "500 MHz Simulated 1H NMR Spectrum")
res <- plotNMRspec(peaks1, x.range = c(12, 0), MHz = 200,
	main = "200 MHz Simulated 1H NMR Spectrum")
par(mfrow = c(1,1))

### Zoom in to show off

par(mfrow = c(2,1))
res <- plotNMRspec(peaks1, x.range = c(4.5, 1), MHz = 500,
	main = "500 MHz Simulated 1H NMR Spectrum")
res <- plotNMRspec(peaks1, x.range = c(4.5, 1), MHz = 200,
	main = "200 MHz Simulated 1H NMR Spectrum")
par(mfrow = c(1,1))

### A simulated 13C NMR spectrum

# This is substantially slower due to the large
# chemical shift range

peaks2 <- data.frame(
	delta = c(160, 155, 145, 143, 135, 60, 32),
	mult = rep(1, 7),
	J = rep(1, 7),
	area = c(0.1, 0.3, 0.3, 1, 1, 0.5, 0.5),
	pw = rep(1, 7))

res <- plotNMRspec(peaks2, x.range = c(180, 0), MHz = 200,
	main = "200 MHz Simulated 13C NMR Spectrum", ppHz = 4,
	pkLabs = FALSE, nuclei = "13C")

# Try repeating the above with ppHz = 1; note the peaks heights are not quite right
# as there are not enough data points to define the peak properly.




