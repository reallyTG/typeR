library(bio3d)


### Name: cnapath
### Title: Suboptimal Path Analysis for Correlation Networks
### Aliases: cnapath summary.cnapath print.cnapath
### Keywords: utilities

### ** Examples

## No test: 
# Redundant testing excluded

if (!requireNamespace("igraph", quietly = TRUE)) {
   message('Need igraph installed to run this example')
} else {

attach(transducin)
inds = match(c("1TND_A", "1TAG_A"), pdbs$id)

npdbs <- trim(pdbs, row.inds=inds)
gaps.res <- gap.inspect(npdbs$ali)

modes <- nma(npdbs)
cij <- dccm(modes)
net <- cna(cij, cutoff.cij=0.3)

# get paths
pa1 <- cnapath(net[[1]], from = 314, to=172, k=50)
pa2 <- cnapath(net[[2]], from = 314, to=172, k=50)

# print the information of a path
pa1

# print two paths simultaneously
pas <- list(pa1, pa2)
names(pas) <- c("GTP", "GDP")
print.cnapath(pas)

# Or, for the same effect,
# summary(pa1, pa2, label=c("GTP", "GDP"))

# replace node numbers with residue name and residue number in the PDB file
pdb <- read.pdb("1tnd")
pdb <- trim.pdb(pdb, atom.select(pdb, chain="A", resno=npdbs$resno[1, gaps.res$f.inds]))
print.cnapath(pas, pdb=pdb)

# plot path length distribution and node degeneracy
print.cnapath(pas, pdb = pdb, col=c("red", "darkgreen"), plot=TRUE)

# View paths in 3D molecular graphic with VMD
#vmd.cnapath(pa1, pdb, launch = TRUE)
#vmd.cnapath(pa1, pdb, colors = 7, launch = TRUE)
#vmd.cnapath(pa1, pdb, spline=TRUE, colors=c("pink", "red"), launch = TRUE)
#pdb2 <- read.pdb("1tag")
#pdb2 <- trim.pdb(pdb2, atom.select(pdb2, chain="A", resno=npdbs$resno[2, gaps.res$f.inds]))
#vmd.cnapath(pa2, pdb2, launch = TRUE)

detach(transducin)

}
## End(No test)



