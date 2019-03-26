library(bio3d)


### Name: read.all
### Title: Read Aligned Structure Data
### Aliases: read.all
### Keywords: IO

### ** Examples

# still working on speeding this guy up
## Not run: 
##D ## Read sequence alignment
##D file <- system.file("examples/kif1a.fa",package="bio3d")
##D aln  <- read.fasta(file)
##D 
##D ## Read aligned PDBs storing all data for 'sel'
##D sel <- c("N", "CA", "C", "O", "CB", "*G", "*D",  "*E", "*Z")
##D pdbs <- read.all(aln, sel=sel)
##D 
##D atm <- colnames(pdbs$all)
##D ca.ind  <- which(atm == "CA")
##D core <- core.find(pdbs)
##D core.ind <- c( matrix(ca.ind, nrow=3)[,core$c0.5A.atom] )
##D 
##D ## Fit structures
##D nxyz <- fit.xyz(pdbs$all[1,], pdbs$all,
##D                fixed.inds  = core.ind,
##D                mobile.inds = core.ind)
##D 
##D ngap.col <- gap.inspect(nxyz)
##D 
##D #npc.xray <- pca.xyz(nxyz[ ,ngap.col$f.inds])
##D 
##D #a <- mktrj.pca(npc.xray, pc=1, file="pc1-all.pdb",
##D #               elety=pdbs$all.elety[1,unique( ceiling(ngap.col$f.inds/3) )],
##D #               resid=pdbs$all.resid[1,unique( ceiling(ngap.col$f.inds/3) )],
##D #               resno=pdbs$all.resno[1,unique( ceiling(ngap.col$f.inds/3) )] )
##D 
## End(Not run)




