library(Rpdb)


### Name: merge.coords
### Title: Merging Molecular Systems
### Aliases: merge.atoms merge.coords merge.pdb
### Keywords: manip

### ** Examples

c1 <- coords( 1:3 ,  4:6 ,  7:9 , basis = "xyz")
c2 <- coords(10:12, 13:15, 16:18, basis = "xyz")
merge(c1,c2)

## Not run: 
##D ## Merging objects with different basis sets return an error.
##D c2 <- coords(9:11, 12:14, 15:17, basis = "abc")
##D merge(c1,c2)
## End(Not run)

## Prepare a Pentacene/C70 dimer
C70 <- read.pdb(system.file("examples/C70.pdb",package="Rpdb"))
Pen <- read.pdb(system.file("examples/Pentacene.pdb",package="Rpdb"))
x <- merge(Tz(C70, 3.5, thickness=0.5),Pen)
  



