library(bio3d)


### Name: binding.site
### Title: Binding Site Residues
### Aliases: binding.site
### Keywords: utilities

### ** Examples

   ## No test: 
    # PDB server connection required - testing excluded

     pdb <- read.pdb('3dnd')

     ## automatically identify 'protein' and 'ligand'
     bs <- binding.site(pdb)

     bs$resnames
     #pdb$atom[bs$inds$atom, ]

     # provide indices
     rec.inds <- atom.select(pdb, chain="A", resno=1:350)
     lig.inds <- atom.select(pdb, chain="A", resno=351)
     bs <- binding.site(pdb, a.inds=rec.inds, b.inds=lig.inds)
   
## End(No test)


   ## Not run: 
##D   
##D      # Interaction between peptide and protein
##D      rec.inds <- atom.select(pdb, chain='A', resno=c(1:350))
##D      lig.inds <- atom.select(pdb, chain='I', resno=c(5:24))
##D      bs <- binding.site(pdb, a.inds=rec.inds, b.inds=lig.inds)
##D    
## End(Not run)

   ## No test: 
    # Redundant testing excluded

     # Interaction between two PDB entities   
     #rec <- read.pdb("receptor.pdb")
     #lig <- read.pdb("ligand.pdb")
     rec <- trim.pdb(pdb, inds=rec.inds)
     lig <- trim.pdb(pdb, inds=lig.inds)
     bs <- binding.site(rec, lig, hydrogens=FALSE)
   
## End(No test)



