library(bios2mds)


### Name: write.mmds.pdb
### Title: Writes PDB file
### Aliases: write.mmds.pdb
### Keywords: write

### ** Examples

# writing the first three MDS coordinates of human GPCRs in a PDB file 
data(gpcr)
write.mmds.pdb(gpcr$mmds$sapiens.active,file.pdb="sapiens.pdb",file.pml="sapiens.pml")



