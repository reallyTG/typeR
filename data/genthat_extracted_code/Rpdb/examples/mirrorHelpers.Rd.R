library(Rpdb)


### Name: mirrorHelpers
### Title: Helper Functions for reflection of Atomic Coordinates
### Aliases: Mab Mab.coords Mab.pdb Mbc Mbc.coords Mbc.pdb Mca Mca.coords
###   Mca.pdb Mxy Mxy.coords Mxy.pdb Myz Myz.coords Myz.pdb Mzx Mzx.coords
###   Mzx.pdb mirrorHelpers
### Keywords: manip

### ** Examples

# First lets read a pdb file
x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
visualize(x,mode = NULL)
# Mirror operation with respect to the ab-plan
visualize(Mab(x), mode = NULL)
# Mirror operation with respect to the ab-plan for residue 1
visualize(Mab(x, mask=x$atoms$resid==1), mode = NULL)




