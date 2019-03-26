library(SyncMove)


### Name: mci
### Title: Movement Coordination Index (MCI)
### Aliases: mci

### ** Examples

    # load example data
    data(gazelleRelocations) 

    # create input data frame
    syncRelocs <- syncSubsample(x = gazelleRelocations,
                                startSearch = "2007-09-05 00:00:00",
                                syncIntervalSecs = 3600*24*16,
                                syncAccuracySecs = 3600*24) 

    # calculate MCI
    mci(syncRelocs$data[[1]])



