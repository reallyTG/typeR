library(bio3d)


### Name: difference.vector
### Title: Difference Vector
### Aliases: difference.vector
### Keywords: utilities

### ** Examples

attach(kinesin)
     
# Ignore gap containing positions
gaps.pos <- gap.inspect(pdbs$xyz)
     
#-- Do PCA
pc.xray <- pca.xyz(pdbs$xyz[, gaps.pos$f.inds])
     
# Define a difference vector between two structural states
diff.inds <- c(grep("d1v8ka", pdbs$id), 
               grep("d1goja", pdbs$id))

## Calculate the difference vector
dv <- difference.vector( pdbs$xyz[diff.inds,], gaps.pos$f.inds )

# Calculate the squared overlap between the PCs and the difference vector  
o <- overlap(pc.xray, dv)

detach(kinesin)




