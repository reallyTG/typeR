library(MDplot)


### Name: rmsd
### Title: Root-mean-square-deviation (RMSD) plot
### Aliases: rmsd
### Keywords: Root-mean-square-deviation

### ** Examples

# GROMOS (see load_rmsd() for other input possibilities)
rmsd( load_rmsd( c( system.file( "extdata/rmsd_example_1.txt.gz", package = "MDplot" ),
                    system.file( "extdata/rmsd_example_2.txt.gz", package = "MDplot" ) ) ) )



