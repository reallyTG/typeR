library(MDplot)


### Name: noe
### Title: Plot NOE violations
### Aliases: noe
### Keywords: hbond hydrogen bond

### ** Examples

# GROMOS
noe( load_noe( c( system.file( "extdata/noe_example_1.txt.gz",
                               package = "MDplot" ),
                  system.file( "extdata/noe_example_2.txt.gz",
                               package = "MDplot" ) ) ),
     names = c( "run1", "run2" ), printLegend = TRUE )



