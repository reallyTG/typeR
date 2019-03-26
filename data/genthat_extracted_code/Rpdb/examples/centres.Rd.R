library(Rpdb)


### Name: centres
### Title: Centres-of-Geometry and Centres-of-Mass
### Aliases: centres centres.atoms centres.coords centres.pdb
### Keywords: manip

### ** Examples

# First lets read a pdb file
x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))

# Centres-of-geometry of the residues
centres(x)

# Centre-of-geometry of the whole structure
centres(x, factor = rep(1, natom(x)))
# or
centres(coords(x))

# Centres-of-geometry of the PCB and DCB residues
centres(x, factor = x$atoms$resname)

# Knowing the name of the elements forming
# the C60 of the PCBM molecules (PCB residues)
# we can compute the centres-of-geometry of
# the C60 by neglecting the other atoms of the
# PCB residues.
C60.elename <- paste0("C",sprintf("%0.3d",1:60))

is.PCB <- x$atoms$resname == "PCB" # Produce a mask to select only the PCB residues
is.C60 <- is.PCB & x$atoms$elename %in% C60.elename # Produce a mask to keep only the C60

F <- x$atoms$resid # We use the residue IDs to split the coordinates
F[!is.C60] <- NA # We keep only the atoms of the C60

C60.centres <- centres(x, factor = F)

# Lets check the position of the C60 centres
visualize(x , mode = NULL)
spheres3d(C60.centres)
text3d(Ty(C60.centres, 2), text=paste0("PCB_", rownames(C60.centres)), cex=2)

# Centres-of-mass of the resdiues
symb <- toSymbols(x$atoms$elename) # Convert elename into elemental symbols
# Find the mass of the element in the periodic table
w <- elements[match(symb, elements[,"symb"]),"mass"] 
centres(x, weights =  w)




