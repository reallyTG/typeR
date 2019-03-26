library(bio3d)


### Name: filter.dccm
### Title: Filter for Cross-correlation Matrices (Cij)
### Aliases: filter.dccm
### Keywords: analysis

### ** Examples


## Not run: 
##D 
##D # Example of transducin
##D attach(transducin)
##D 
##D gaps.pos <- gap.inspect(pdbs$xyz)
##D modes <- nma.pdbs(pdbs, ncore=NULL)
##D dccms <- dccm.enma(modes, ncore=NULL)
##D 
##D cij <- filter.dccm(dccms, xyz=pdbs)
##D 
##D # Example protein kinase
##D # Select Protein Kinase PDB IDs
##D ids <- c("4b7t_A", "2exm_A", "1opj_A", "4jaj_A", "1a9u_A",
##D                  "1tki_A", "1csn_A", "1lp4_A")
##D 
##D # Download and split by chain ID
##D files <- get.pdb(ids, path = "raw_pdbs", split=TRUE)
##D 
##D # Alignment of structures
##D pdbs <- pdbaln(files) # Sequence identity
##D summary(c(seqidentity(pdbs)))
##D 
##D # NMA on all structures
##D modes <- nma.pdbs(pdbs, ncore=NULL)
##D 
##D # Calculate correlation matrices for each structure
##D cij <- dccm(modes)
##D 
##D # Set DCCM plot panel names for combined figure
##D dimnames(cij$all.dccm) = list(NULL, NULL, ids)
##D plot.dccm(cij$all.dccm)
##D 
##D # Filter to display only correlations present in all structures
##D cij.all <- filter.dccm(cij, cutoff.sims = 8, cutoff.cij = 0)
##D plot.dccm(cij.all, main = "Consensus Residue Cross Correlation")
##D 
##D detach(transducin)
## End(Not run)




