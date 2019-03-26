library(bio3d)


### Name: geostas
### Title: GeoStaS Domain Finder
### Aliases: geostas geostas.default geostas.xyz geostas.nma geostas.enma
###   geostas.pdb geostas.pdbs amsm.xyz print.geostas
### Keywords: analysis

### ** Examples

## No test: 
# PDB server connection required - testing excluded

#### NMR-ensemble example
## Read a multi-model PDB file 
pdb <- read.pdb("1d1d", multi=TRUE)

## Find domains and write PDB
gs  <- geostas(pdb, fit=TRUE)

## Plot a atomic movement similarity matrix
plot.geostas(gs, contour=FALSE)

## Fit all frames to the 'first' domain
domain.inds <- gs$inds[[1]]

xyz <- pdbfit(pdb, inds=domain.inds)

#write.pdb(pdb, xyz=xyz, chain=gs$atomgrps)

## End(No test)

## Not run: 
##D #### NMA example
##D ## Fetch stucture
##D pdb <- read.pdb("1crn")
##D 
##D ## Calculate (vibrational) normal modes
##D modes <- nma(pdb)
##D 
##D ## Find domains
##D gs <- geostas(modes, k=2)
##D 
##D ## Write NMA trajectory with domain assignment
##D mktrj(modes, mode=7, chain=gs$grps)
##D 
##D ## Redo geostas domain clustering 
##D gs <- geostas(modes, amsm=gs$amsm, k=5)
##D 
##D 
##D 
##D 
##D #### Trajectory example
##D ## Read inn DCD trajectory file, fit coordinates
##D dcdfile <- system.file("examples/hivp.dcd", package = "bio3d")
##D trj <- read.dcd(dcdfile)
##D xyz <- fit.xyz(trj[1,], trj)
##D 
##D ## Find domains
##D gs <- geostas(xyz, k=3, fit=FALSE)
##D 
##D ## Principal component analysis 
##D pc.md <- pca.xyz(xyz)
##D 
##D ## Visualize PCs with colored domains (chain ID)
##D mktrj(pc.md, pc=1, chain=gs$grps)
##D 
##D 
##D 
##D 
##D #### X-ray ensemble GroEL subunits
##D # Define the ensemble PDB-ids
##D ids <- c("1sx4_[A,B,H,I]", "1xck_[A-B]", "1sx3_[A-B]", "4ab3_[A-B]")
##D 
##D # Download and split PDBs by chain ID
##D raw.files <- get.pdb(ids, path = "raw_pdbs", gzip = TRUE)
##D files <- pdbsplit(raw.files, ids, path = "raw_pdbs/split_chain/")
##D 
##D # Align structures
##D pdbs <- pdbaln(files)
##D 
##D # Find domains
##D gs <- geostas(pdbs, k=4, fit=TRUE)
##D 
##D # Superimpose to core region
##D pdbs$xyz <- pdbfit(pdbs, inds=gs$fit.inds)
##D 
##D # Principal component analysis 
##D pc.xray <- pca(pdbs)
##D 
##D # Visualize PCs with colored domains (chain ID)
##D mktrj(pc.xray, pc=1, chain=gs$grps)
##D 
##D 
##D ##- Same, but more manual approach 
##D gaps.pos <- gap.inspect(pdbs$xyz)
##D 
##D # Find core region
##D core <- core.find(pdbs)
##D 
##D # Fit to core region
##D xyz <- fit.xyz(pdbs$xyz[1, gaps.pos$f.inds],
##D                pdbs$xyz[, gaps.pos$f.inds],
##D                fixed.inds=core$xyz,
##D                mobile.inds=core$xyz)
##D 
##D # Find domains
##D gs <- geostas(xyz, k=4, fit=FALSE)
##D 
##D # Perform PCA
##D pc.xray <- pca.xyz(xyz)
##D 
##D # Make trajectory
##D mktrj(pc.xray, pc=1, chain=gs$grps)
##D 
## End(Not run)



