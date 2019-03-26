library(Rpdb)


### Name: Rpdb-package
### Title: Read, Write, Visualize and Manipulate PDB Files
### Aliases: Rpdb-package
### Keywords: package

### ** Examples

## Read a PDB file included in the package
x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))

## Visualize the PDB file
visualize(x, mode = NULL)

## From Cartesian to fractional coordinates and vice versa
x <- xyz2abc(x)
basis(x)
natom(x,x$atoms$resid)
range(x)
centres(x)
x <- abc2xyz(x)
basis(x)
natom(x,x$atoms$resid)
range(x)
centres(x)

## Split and unsplit
F <- x$atoms$resid
x <-   split(x, F)
x <- unsplit(x, F)

## Subset and merge
x.PCB.only <- subset(x, resname == "PCB")
x.DCB.only <- subset(x, resname == "DCB")
x <- merge(x.PCB.only, x.DCB.only)

## Duplicate and wrap
x <- replicate(x, a.ind = -1:1, b.ind = -1:1, c.ind = -1:1)
x <- wrap(x)

## Write the 'pdb' object 'x' in a temporary file.
write.pdb(x, file = tempfile())




