library(bio3d)


### Name: pdbs2sse
### Title: SSE annotation for a PDBs Object
### Aliases: pdbs2sse
### Keywords: utilities

### ** Examples

## Not run: 
##D attach(transducin)
##D 
##D ## calculate RMSF
##D rf <- rmsf(pdbs$xyz)
##D 
##D ## Fetch SSE annotation, output in terms of alignment index
##D sse <- pdbs2sse(pdbs, ind=1, rm.gaps=FALSE, resno=FALSE)
##D 
##D ## Add SSE annotation to plot
##D plotb3(rf, sse=sse)
##D 
##D 
##D ## Calculate RMSF only for non-gap columns
##D gaps.pos <- gap.inspect(pdbs$xyz)
##D rf <- rmsf(pdbs$xyz[, gaps.pos$f.inds])
##D 
##D ## With gap columns removed, output in terms of residue number
##D sse <- pdbs2sse(pdbs, ind=1, rm.gaps=TRUE, resno=TRUE)
##D gaps.res <- gap.inspect(pdbs$ali)
##D plotb3(rf, sse=sse, resno=pdbs$resno[1, gaps.res$f.inds])
##D 
##D detach(transducin)
## End(Not run)



