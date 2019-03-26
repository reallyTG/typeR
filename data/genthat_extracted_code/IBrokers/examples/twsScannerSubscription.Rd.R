library(IBrokers)


### Name: twsScannerSubscription
### Title: Create ScannerSubscription
### Aliases: twsScannerSubscription
### Keywords: class

### ** Examples

scnr <- twsScannerSubscription(numberOfRows=10,
                               instrument="STK",
                               locationCode="STK.US.MAJOR",
                               scanCode="TOP_PERC_GAIN",
                               aboveVolume=0,
                               marketCapAbove=1e8,
                               scannerSettingPairs="Annual,true",
                               stockTypeFilter="ALL")
scnr



