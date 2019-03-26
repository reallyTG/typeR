library(bio3d)


### Name: overlap
### Title: Overlap analysis
### Aliases: overlap
### Keywords: utilities

### ** Examples

attach(kinesin)
     
# Ignore gap containing positions
##gaps.res <- gap.inspect(pdbs$ali)
gaps.pos <- gap.inspect(pdbs$xyz)
     
#-- Do PCA
pc.xray <- pca.xyz(pdbs$xyz[, gaps.pos$f.inds])
    
# Define a difference vector between two structural states
diff.inds <- c(grep("d1v8ka", pdbs$id), 
               grep("d1goja", pdbs$id))

dv <- difference.vector( pdbs$xyz[diff.inds,], gaps.pos$f.inds )

# Calculate the squared overlap between the PCs and the difference vector  
o <- overlap(pc.xray, dv)
o <- overlap(pc.xray$U, dv)

# Plot results
plot(o$overlap, type='h', ylim=c(0,1))
points(o$overlap)
lines(o$overlap.cum, type='b', col='red')


detach(kinesin)

## Not run: 
##D ## Calculate overlap from NMA
##D pdb.a <- read.pdb("1cmk")
##D pdb.b <- read.pdb("3dnd")
##D 
##D ## Fetch CA coordinates
##D sele.a <- atom.select(pdb.a, chain='E', resno=c(15:350), elety='CA')
##D sele.b <- atom.select(pdb.b, chain='A', resno=c(1:350), elety='CA')
##D 
##D xyz <- rbind(pdb.a$xyz[sele.a$xyz],
##D              pdb.b$xyz[sele.b$xyz])
##D 
##D ## Superimpose
##D xyz[2,] <- fit.xyz(xyz[1,], xyz[2,], 1:ncol(xyz))
##D 
##D ## The difference between the two conformations
##D dv <- difference.vector( xyz )
##D 
##D ## Calculate normal modes
##D modes <- nma(pdb.a, inds=sele.a)
##D 
##D # Calculate the squared overlap between the normal modes 
##D # and the difference vector  
##D o <- overlap(modes, dv)
## End(Not run)



