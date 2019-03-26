library(geex)


### Name: setup_root_control
### Title: Setup a root_control object
### Aliases: setup_root_control

### ** Examples

# Setup the default
setup_root_control(start = c(3, 5, 6))

# Also setup the default
setup_root_control(FUN = rootSolve::multiroot,
                   start = c(3, 5, 6))

# Or use uniroot()
setup_root_control(FUN = stats::uniroot,
                   interval = c(0, 1))



