library(Rpdb)


### Name: bond-angle-dihedral
### Title: Atomic Bond Lengths, Angles and Dihedrals
### Aliases: angle angle.coords angle.pdb bond bond-angle-dihedral
###   bond.coords bond.pdb dihedral dihedral.coords dihedral.pdb measure
###   measure.coords measure.default measure.pdb
### Keywords: dynamic manip

### ** Examples

Pen <- read.pdb(system.file("examples/Pentacene.pdb",package="Rpdb"))
visualize(Pen, mode = NULL)
text3d(coords(Pen), texts=Pen$atoms$eleid)
bond(Pen,3:4,1:2)
angle(Pen,3:4,1:2,5:6)
dihedral(Pen,3:4,1:2,5:6,6:5)




