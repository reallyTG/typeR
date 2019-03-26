library(Rpdb)


### Name: conect
### Title: Create 'conect' Object
### Aliases: conect conect.coords conect.default conect.pdb is.conect
### Keywords: classes

### ** Examples

# If atom 1 is connected to atom 2, 3, 4 and 5
# then we can prepare the following 'conect' object:
x <- conect(rep(1,4),2:5)
print(x)
is.conect(x)

# Compute conectivity from coordinates
x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"), CONECT = FALSE)
x$conect
x$conect <- conect(x)
x$conect




