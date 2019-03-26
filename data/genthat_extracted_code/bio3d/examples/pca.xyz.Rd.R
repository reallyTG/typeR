library(bio3d)


### Name: pca.xyz
### Title: Principal Component Analysis
### Aliases: pca.xyz print.pca
### Keywords: utilities multivariate

### ** Examples


## Not run: 
##D #-- Read transducin alignment and structures
##D aln <- read.fasta(system.file("examples/transducin.fa",package="bio3d"))
##D pdbs <- read.fasta.pdb(aln)
##D 
##D # Find core
##D core <- core.find(pdbs, 
##D                   #write.pdbs = TRUE,
##D                   verbose=TRUE)
##D 
##D rm(list=c("pdbs", "core"))
## End(Not run)

#-- OR for demo purposes just read previously saved transducin data
attach(transducin)

# Previously fitted coordinates based on sub 1.0A^3 core. See core.find() function.
xyz <- pdbs$xyz
                
#-- Do PCA ignoring gap containing positions
pc.xray <- pca.xyz(xyz, rm.gaps=TRUE)

# Plot results (conformer plots & scree plot overview)
plot(pc.xray, col=annotation[, "color"])

# Plot a single conformer plot of PC1 v PC2
plot(pc.xray, pc.axes=1:2, col=annotation[, "color"])

## Plot atom wise loadings
plot.bio3d(pc.xray$au[,1], ylab="PC1 (A)")

## No test: 
# PDB server connection required - testing excluded

## Plot loadings in relation to reference structure 1TAG
pdb <- read.pdb("1tag")
ind <- grep("1TAG", pdbs$id)             ## location in alignment

resno <- pdbs$resno[ind, !is.gap(pdbs)]  ## non-gap residues
tpdb <- trim.pdb(pdb, resno=resno)

op <- par(no.readonly=TRUE)
par(mfrow = c(3, 1), cex = 0.6, mar = c(3, 4, 1, 1))
plot.bio3d(pc.xray$au[,1], resno, ylab="PC1 (A)", sse=tpdb)
plot.bio3d(pc.xray$au[,2], resno, ylab="PC2 (A)", sse=tpdb)
plot.bio3d(pc.xray$au[,3], resno, ylab="PC3 (A)", sse=tpdb)
par(op)
## End(No test)

## Not run: 
##D # Write PC trajectory
##D resno = pdbs$resno[1, !is.gap(pdbs)]
##D resid = aa123(pdbs$ali[1, !is.gap(pdbs)])
##D 
##D a <- mktrj.pca(pc.xray, pc=1, file="pc1.pdb",
##D                resno=resno, resid=resid )
##D 
##D b <- mktrj.pca(pc.xray, pc=2, file="pc2.pdb",
##D                resno=resno, resid=resid )
##D 
##D c <- mktrj.pca(pc.xray, pc=3, file="pc3.pdb",
##D                resno=resno, resid=resid )
## End(Not run)

detach(transducin)



