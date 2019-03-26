library(bio3d)


### Name: pdb.annotate
### Title: Get Customizable Annotations From PDB Or PFAM Databases
### Aliases: pdb.annotate pdb.pfam
### Keywords: utilities

### ** Examples

## No test: 
# PDB server connection required - testing excluded

# Fetch all annotation terms
ids <- c("6Q21_B", "1NVW", "1P2U_A")
anno <- pdb.annotate(ids)

# Access terms, e.g. ligand names:
anno$ligandName

## only unique PDB IDs
anno <- pdb.annotate(ids, unique=TRUE)

# Fetch only specific terms
pdb.annotate(ids, anno.terms = c("ligandId", "citation"))

## End(No test)

## Not run: 
##D # PFAM server connection required - testing excluded
##D 
##D # Find PFAM annotations of PDB entries
##D pdb.pfam(c("6Q21_A", "1NVW", "1P2U_A"))
##D 
##D # More details and a not fond entry warning
##D pdb.pfam(c("1P2U_A", "6Q21_B"), compact=FALSE)
## End(Not run)




