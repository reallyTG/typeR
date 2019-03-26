library(MDplot)


### Name: load_xrmsd
### Title: Loading function for 'xrmsd()'
### Aliases: load_xrmsd
### Keywords: xrmsd

### ** Examples

# GROMOS
load_xrmsd( system.file( "extdata/xrmsd_example.txt.gz",
                         package = "MDplot" ),
            factor = 10000 )

# GROMACS
load_xrmsd( system.file( "extdata/xrmsd_example_GROMACS.xpm.gz",
                         package = "MDplot" ),
            mdEngine = "GROMACS" )

# AMBER
load_xrmsd( system.file( "extdata/xrmsd_example_AMBER.txt.gz",
                         package = "MDplot" ),
            mdEngine = "AMBER" )



