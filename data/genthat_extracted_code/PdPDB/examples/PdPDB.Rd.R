library(PdPDB)


### Name: PdPDB
### Title: Pattern Discovery in PDB Structures of Metalloproteins
### Aliases: PdPDB
### Keywords: PDB, alignment, coordinating ligand metal, metalloproteins,
###   motifs patterns,

### ** Examples

################ Defining path to PDBs
path_to_PDB="inst/extdata/PDB" # this is where pdb/cif files are stored

################ Research Parameters
metal="SF4"  # searches for [4fe-4s] coordinating patterns
n=1  # searches for x(L)x patterns, (L) coordinates to SF4
perc=20  # drops residues with less than the 20% of frequency
interactive= 0 # interactive. User decided references and dendrogram cut
dropsReplicate=0 # do not remove replicated patterns 

################ Launch PdPDB
PdPDB(path_to_PDB,metal,n, perc, interactive, dropsReplicate)



