library(bio3d)


### Name: pdb2aln.ind
### Title: Mapping from alignment positions to PDB atomic indices
### Aliases: pdb2aln.ind
### Keywords: utilities

### ** Examples

## Not run: 
##D ##--- Read aligned PDB coordinates (CA only)
##D aln  <- read.fasta(system.file("examples/kif1a.fa",package="bio3d"))
##D pdbs <- read.fasta.pdb(aln)
##D 
##D ##--- Read the topology file of MD simulations
##D ##--- For illustration, here we read another pdb file (all atoms)
##D pdb <- read.pdb("2kin")
##D 
##D #--- Map the non-gap positions to PDB C-alpha atoms
##D #pc.inds <- gap.inspect(pdbs$ali)
##D #npc.inds <- pdb2aln.ind(aln=pdbs, pdb=pdb, inds=pc.inds$f.inds)
##D 
##D #npc.inds$a
##D #npc.inds$b
##D 
##D #--- Or, map the non-gap positions with a known close sequence in the alignment
##D #npc.inds <- pdb2aln.ind(aln=pdbs, pdb=pdb, aln.id="1bg2", inds=pc.inds$f.inds)
##D 
##D #--- Map core positions
##D core <- core.find(pdbs)
##D core.inds <- pdb2aln.ind(aln=pdbs, pdb=pdb, inds = core$c1A.atom)
##D 
##D core.inds$a
##D core.inds$b
##D 
##D ##--- Fit simulation trajectories to one of the X-ray structures based on
##D ##--- core positions
##D #xyz <- fit.xyz(pdbs$xyz[1,], pdb$xyz, core.inds$a$xyz, core.inds$b$xyz)
##D 
##D ##--- Do PCA of trajectories based on non-gap positions
##D #pc.traj <- pca(xyz[, npc.inds$b$xyz])
##D 
## End(Not run)




