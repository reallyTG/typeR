library(bio3d)


### Name: rmsf
### Title: Atomic RMS Fluctuations
### Aliases: rmsf
### Keywords: utilities

### ** Examples

attach(transducin)

# Ignore Gaps
gaps <- gap.inspect(pdbs$ali)

r <- rmsf(pdbs$xyz)
plot(r[gaps$f.inds], typ="h", ylab="RMSF (A)")

detach(transducin)

## Not run: 
##D 
##D pdb <- read.pdb("1d1d", multi=TRUE)
##D xyz <- pdb$xyz
##D 
##D # superimpose trajectory
##D xyz <- fit.xyz(xyz[1, ], xyz)
##D 
##D # select mainchain atoms
##D sele <- atom.select(pdb, elety=c("CA", "C", "N", "O"))
##D 
##D # residue numbers to group by
##D resno <- pdb$atom$resno[sele$atom]
##D 
##D # mean rmsf value of mainchain atoms of each residue
##D r <- rmsf(xyz[, sele$xyz], grpby=resno)
##D plot.bio3d(r, resno=pdb, sse=pdb, ylab="RMSF (A)")
##D 
## End(Not run)




