library(race)


### Name: race
### Title: Racing methods for the selection of the best
### Aliases: race
### Keywords: design htest optimize

### ** Examples

# The wrapper and init functions for this example are defined in the
# file examples/example-wrapper.R in the installation directory of the
# package.  Please, have a look at such file before implementing your
# own wrapper.
# This example require the package `nnet'
if (require(nnet)&&require(datasets)){
  example.wrapper<-file.path(system.file(package="race"),
                           "examples","example-wrapper.R")
  # Run the race
  race(example.wrapper)

  # If the package `rpvm' is installed on your system and if PVM is
  # properly installed and configured, you can try the following:
  #race(example.wrapper,no.slaves=6)
}



