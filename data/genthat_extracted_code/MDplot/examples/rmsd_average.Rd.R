library(MDplot)


### Name: rmsd_average
### Title: Root-mean-square-deviation (RMSD) average plot
### Aliases: rmsd_average
### Keywords: Root-mean-square-deviation

### ** Examples

# GROMOS (see load_rmsd() for other input possibilities)
rmsd_average( list( load_rmsd( system.file( "extdata/rmsd_example_1.txt.gz",
                                            package = "MDplot" ) ),
                    load_rmsd( system.file( "extdata/rmsd_example_2.txt.gz",
                                            package = "MDplot" ) ) ),
              snapshotsPerTimeInt = 2000, maxYAxis = 0.445 )



