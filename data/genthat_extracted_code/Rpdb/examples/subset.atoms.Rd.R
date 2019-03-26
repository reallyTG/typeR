library(Rpdb)


### Name: subset.atoms
### Title: Subsetting 'atoms' and 'pdb' Objects
### Aliases: subset.atoms subset.pdb
### Keywords: manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
y <- subset(x, x$atoms$eleid %in% sample(x$atoms$eleid, 10))
is(y)
y <- subset(x$atoms, x$atoms$eleid %in% sample(x$atoms$eleid, 10))
is(y)
x <- coords(x)
y <- subset(x, x < 0)
is(y)




