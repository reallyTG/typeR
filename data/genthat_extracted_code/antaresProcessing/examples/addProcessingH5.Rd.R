library(antaresProcessing)


### Name: addProcessingH5
### Title: Add process results of antaresProcessing to an ANTARES .h5 files
### Aliases: addProcessingH5

### ** Examples


## Not run: 
##D addProcessingH5(opts = opts,  mcY = "mcInd",
##D                addDownwardMargin = TRUE,
##D                addUpwardMargin = TRUE,
##D                addExportAndImport = TRUE,
##D                addLoadFactorLink = TRUE,
##D                correctBalance = TRUE,
##D                externalDependency = TRUE,
##D                loadFactor = TRUE,
##D                modulation = TRUE,
##D                netLoadRamp = TRUE,
##D                surplus = TRUE,
##D                surplusClusters = TRUE,
##D                evalAreas = list(Tota = "`H. STOR` + `MISC. DTG`",
##D                                 Tota2 = "`NODU` + `NP COST` + 1"),
##D                evalLinks = list(),
##D                evalClusters = list(),
##D                evalDistricts = list()
##D                )
##D 
##D #After write of new columns, new aliases are avialable in antaresRead.You can use
##D #showAliases() to see them. Prifix Out_ is used to distinguish them.
##D showAliases("Out_surplusClusters")
##D readAntares(opts = opts, select = "Out_surplusClusters")
##D 
## End(Not run)




