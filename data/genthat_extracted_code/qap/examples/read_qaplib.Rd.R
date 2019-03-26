library(qap)


### Name: read_qaplib
### Title: Read QAPLIB Files
### Aliases: read_qaplib
### Keywords: manip

### ** Examples

## load a QAPLIB problem instance
p <- read_qaplib(system.file("qaplib", "had12.dat", package="qap"))
p

## list all QAPLIB instances
dir(system.file("qaplib", package="qap"), pattern = "*.dat")



