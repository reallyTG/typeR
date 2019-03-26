library(MDplot)


### Name: TIcurve
### Title: Thermodynamic integration plot
### Aliases: TIcurve
### Keywords: Thermodynamic integration

### ** Examples

# GROMOS (forward integration)
TIcurve( load_TIcurve( system.file( "extdata/TIcurve_example.txt.gz",
                                    package = "MDplot" ) ) )

# GROMOS (forward and backward integration)
TIcurve( load_TIcurve( c( system.file( "extdata/TIcurve_fb_forward_example.txt.gz",
                                       package = "MDplot" ),
                          system.file( "extdata/TIcurve_fb_backward_example.txt.gz",
                          package = "MDplot" ) ) ),
         invertedBackwards = TRUE )



