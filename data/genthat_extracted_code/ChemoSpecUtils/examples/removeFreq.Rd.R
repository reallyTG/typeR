library(ChemoSpecUtils)


### Name: removeFreq
### Title: Remove Frequencies from a Spectra or Spectra2D Object
### Aliases: removeFreq
### Keywords: utilities

### ** Examples

if (requireNamespace("ChemoSpec", quietly = TRUE)) {
  library("ChemoSpec")
  data(SrE.IR)
  sumSpectra(SrE.IR)

  # Remove frequencies from one end:
  newIR <- removeFreq(SrE.IR, rem.freq = SrE.IR$freq > 3500)

  # Remove frequencies from both ends at once:
  newIR <- removeFreq(SrE.IR, rem.freq = SrE.IR$freq > 3500
     | SrE.IR$freq < 800)

  # Remove frequencies from the middle:
  newIR <- removeFreq(SrE.IR, rem.freq = SrE.IR$freq > 800
     & SrE.IR$freq < 1000)

  # The logic of this last one is as follows.  Any values
  # that are TRUE will be removed.
  values <- 1:7
  values > 2
  values < 6
  values > 2 & values < 6

  # After any of these, inspect the results:
  sumSpectra(newIR)
}

if (requireNamespace("ChemoSpec2D", quietly = TRUE)) {
  library("ChemoSpec2D")
  data(MUD1)

  plotSpectra2D(MUD1, which = 7, lvls = seq(-1, 1, by = 0.2),
    main = "MUD1 Sample 7: Complete Data Set")

  MUD1a <- removeFreq(MUD1, remF2 = 2 ~ 4)
  sumSpectra(MUD1a) # cannot plot, results would be misleading

  MUD1b <- removeFreq(MUD1, remF1 = low ~ 15)
  sumSpectra(MUD1b)
  plotSpectra2D(MUD1b, which = 7, lvls = seq(-1, 1, by = 0.2),
    main = "MUD1 Sample 7\nRemoved Frequencies: F1 low ~ 15")

  MUD1c <- removeFreq(MUD1, remF2 = low ~ 5)
  sumSpectra(MUD1c)
  plotSpectra2D(MUD1c, , which = 7, lvls = seq(-1, 1, by = 0.2),
    main = "MUD1 Sample 7\nRemoved Frequencies: F2 low ~ 5")

  MUD1d <- removeFreq(MUD1, remF2 = 6 ~ high, remF1 = 13 ~ 17)
  sumSpectra(MUD1d) # not plotted, results would be misleading
}




