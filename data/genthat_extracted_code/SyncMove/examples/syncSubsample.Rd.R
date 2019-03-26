library(SyncMove)


### Name: syncSubsample
### Title: Subsamples Temporal Data to Synchronal Events
### Aliases: syncSubsample

### ** Examples

    # load example data
    data(gazelleRelocations)

    # subsample sychronal events
    syncRelocs <- syncSubsample(x = gazelleRelocations,
                                startSearch = "2007-09-05 00:00:00",
                                syncIntervalSecs = 3600*24*16,
                                syncAccuracySecs = 3600*24)

    # show results overview
    syncRelocs$overview

    # show first subsample
    syncRelocs$data[[1]]

    # show entities of first subsample
    syncRelocs$entities[[1]]



