library(seqinr)


### Name: plotladder
### Title: Simple plot of an allelic ladder from ABIF data
### Aliases: plotladder

### ** Examples

  #
  # load an example of allelic ladder results from an ABIF (*.fsa) file:
  #
data(ECH)
  #
  # Extract from internal size standard chanel number 5 the location 
  # of 14 peaks:
  #
ECH.maxis <- peakabif(ECH, 5, npeak = 14, tmin = 2.7, thres = 0.1, fig = FALSE)$maxis
  #
  # Load data about the expected size of peaks in bp for calibration:
  #
data(gs500liz)
lizbp <- gs500liz$liz # All peaks size in bp
lizbp[!gs500liz$mask1 | !gs500liz$mask2] <- NA # Mark useless peaks
lizbp <- lizbp[-c(1,2)] # The first two peaks are not extracted from ECH
ECH.calibr <- splinefun(ECH.maxis[!is.na(lizbp)], lizbp[!is.na(lizbp)])
  #
  # Show the allelic ladder for the 4 dyes:
  #
plotladder(ECH, 1, ECH.calibr, tmin = 3.1, thres = 0.3, fig = FALSE)
plotladder(ECH, 2, ECH.calibr, tmin = 3.1, thres = 0.35, fig = FALSE)
plotladder(ECH, 3, ECH.calibr, tmin = 3.1, thres = 0.2, fig = FALSE)
plotladder(ECH, 4, ECH.calibr, tmin = 3.1, thres = 0.2, fig = FALSE)



