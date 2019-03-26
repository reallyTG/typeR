library(hyperSpec)


### Name: sweep
### Title: Sweep Summary Statistic out of an hyperSpec Object 'sweep' for
###   'hyperSpec' objects.
### Aliases: sweep sweep-methods sweep,hyperSpec-method
### Keywords: methods

### ** Examples


## Substract the background / slide / blank spectrum
# the example data does not have spectra of the empty slide,
# so instead the overall composition of the sample is substracted
background <- apply (chondro, 2, quantile, probs = 0.05)
corrected <- sweep (chondro, 2, background, "-")
plot (corrected, "spcprctl5")

## Offset correction
offsets <- apply (chondro, 1, min)
corrected <- sweep (chondro, 1, offsets, "-")
plot (corrected, "spcprctl5")

## Min-max normalization (on max amide I)
# the minimum is set to zero by the offset correction.
factor <- apply (corrected, 1, max)
mm.corrected <- sweep (corrected, 1, factor, "/")
plot (mm.corrected, "spcprctl5")

## convenience: give function to compute STATS:
mm.corrected2 <- sweep (corrected, 1, max, "/")
plot (mm.corrected2)

## checking
stopifnot (all (mm.corrected2 == mm.corrected))




