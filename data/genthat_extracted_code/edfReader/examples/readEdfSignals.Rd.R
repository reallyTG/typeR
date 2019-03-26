library(edfReader)


### Name: readEdfSignals
### Title: Reads signals from an EDF(+)/BDF(+) file
### Aliases: readEdfSignals readBdfSignals

### ** Examples

# Examples from the vignette
libDir <- system.file ("extdata", package="edfReader")
# a continuous recording
CFile <- paste (libDir, '/edfPlusC.edf', sep='')
CHdr  <- readEdfHeader (CFile)
CSignals <- readEdfSignals (CHdr)            # to read all signals
# read 3 differently designated signals from 5.1 till 18 seconds period
someCSignalsPeriod <- readEdfSignals (CHdr, signals=c(3, "5", "sine 8.5 Hz"), from=5.1, till=18)
someCSignalsPeriod                           # print the signals
summary(someCSignalsPeriod)                  # print singals summary
someCSignalsPeriod$`sine 8.5 Hz`             # print the `sine 8.5 Hz` signal
summary(someCSignalsPeriod$`sine 8.5 Hz`)    # print a `sine 8.5 Hz` signal summary
str(CSignals$`sine 8.5 Hz`)                  # look to the details
# a discontinuous recording
DFile <- paste (libDir, '/edfPlusD.edf', sep='')
DHdr  <- readEdfHeader (DFile)
DSignals <- readEdfSignals (DHdr, fragments=TRUE)    # to read all signals
DSignals$`sine 8.5 Hz`                       # print fragmented signal
summary (DSignals$`sine 8.5 Hz`)             # print fragmented signal summary
str(DSignals$`sine 8.5 Hz`)                  # look to the details



