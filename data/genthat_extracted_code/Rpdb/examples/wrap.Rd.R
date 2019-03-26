library(Rpdb)


### Name: wrap
### Title: Wrap Atomic Coordinates
### Aliases: wrap wrap.atoms wrap.coords wrap.pdb
### Keywords: manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))

#  Translation of the atoms along x-axis
x$atoms$x1 <- x$atoms$x1 + 10

#  Wrapping the structure
y <- wrap(x)




