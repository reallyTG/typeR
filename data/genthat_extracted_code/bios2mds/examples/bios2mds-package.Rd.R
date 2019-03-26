library(bios2mds)


### Name: bios2mds-package
### Title: From BIOlogical Sequences to MultiDimensional Scaling
### Aliases: bios2mds-package bios2mds
### Keywords: package

### ** Examples

# The MSA files provided with the package correspond to the sequence 
# alignment of non-olfactory class A G-protein-coupled receptors from
# H. sapiens and D. melanogaster prepared by Deville et al. (2009).  

# loading GPCR data
data(gpcr)

# building distance matrices between the aligned GPCR sequences from
# H. sapiens and D. melanogaster
human <- import.fasta(system.file("msa/human_gpcr.fa", package = "bios2mds"))
drome <- import.fasta(system.file("msa/drome_gpcr.fa", package = "bios2mds"))

#active <- mat.dif(human, human)
# or
active <- gpcr$dif$sapiens.sapiens

#sup <- mat.dif(drome, human)
# or
sup <- gpcr$dif$melanogaster.sapiens

# performing MDS analysis of the GPCR sequences from H. sapiens 
mmds_active <- mmds(active, group.file=system.file(
"csv/human_gpcr_group.csv",package = "bios2mds"))

# performing MDS analysis of the GPCR sequences from H. sapiens 
# with projection of GPCRs from D. melanogaster 
# as supplementary elements onto the space of human GPCRs
mmds_sup <- mmds.project(mmds_active, sup,system.file(
"csv/drome_gpcr_group.csv",package = "bios2mds"))

# displaying MDS coordinates 
layout(matrix(1:6, 2, 3))

scree.plot(mmds_active$eigen.perc, lab = TRUE, title = "Scree plot of metric MDS")

mmds.2D.plot(mmds_active, title = "Sequence space of human GPCRs ")

mmds.2D.plot(mmds_active,mmds_sup, title = "Projection of GPCRs from D. melanogaster
 onto the space space of human GPCRs ", active.alpha = 0.3)

# writing PDB files for 3D visualization of MDS coordinates
write.mmds.pdb(mmds_active) 




