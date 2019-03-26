library(SpecHelpers)


### Name: plot2DNMRspec
### Title: Draw a 2D NMR Spectrum
### Aliases: plot2DNMRspec
### Keywords: utilities

### ** Examples


### ethyl 2-ethyl-3-oxobutyrate
### Set up data

peaks1 <- data.frame(
#             A     B     C     D     E     F
	delta = c(4.20, 3.34, 2.23, 1.88, 1.28, 0.94),
	mult = c(4, 3, 1, 5, 3, 3),
	J = c(14, 14, 0, 14, 14, 14),
	area = c(2, 1, 3, 2, 3, 3),
	pw = c(2, 2, 2, 2, 2, 2))

#              A, B, C, D, E, F
AM <- matrix(c(0, 0, 0, 0, 1, 0,  # A
               0, 0, 0, 1, 0, 0,  # B
               0, 0, 0, 0, 0, 0,  # C
               0, 1, 0, 0, 0, 1,  # D
               1, 0, 0, 0, 0, 0,  # E
               0, 0, 0, 1, 0, 0), # F
			   ncol = 6)

### 1D 1H NMR plot for reference
# CRAN checks will skip some examples to save time


jnk <- plotNMRspec(peaks = peaks1, x.range = c(0, 5), MHz = 500,
main = "1H NMR of ethyl 2-ethyl-3-oxobutyrate")

### 2D COSY plot

res <- plot2DNMRspec(peaks = peaks1, x.range = c(0, 5), MHz = 500, ppHz = 1, M = AM,
main = "COSY of ethyl 2-ethyl-3-oxobutyrate")

### 2D TOCSY plot

## Not run: 
##D 
##D res <- plot2DNMRspec(peaks = peaks1, x.range = c(0, 5), MHz = 500, ppHz = 1,
##D levels = c(0.85, 0.9, 0.95), type = "TOCSY",
##D main = "TOCSY of ethyl 2-ethyl-3-oxobutyrate")
## End(Not run)



