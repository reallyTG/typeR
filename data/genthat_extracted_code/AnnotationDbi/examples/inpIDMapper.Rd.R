library(AnnotationDbi)


### Name: inpIDMapper
### Title: Convenience functions for mapping IDs through an appropriate set
###   of annotation packages
### Aliases: inpIDMapper intraIDMapper idConverter
### Keywords: manip

### ** Examples

## Not run: 
##D   ## This has to be in a dontrun block because otherwise I would have to
##D   ## expand the DEPENDS field for AnnotationDbi
##D   ## library("org.Hs.eg.db")
##D   ## library("org.Mm.eg.db")
##D   ## library("org.Sc.eg.db")
##D   ## library("hom.Hs.inp.db")
##D   ## library("hom.Mm.inp.db")
##D   ## library("hom.Sc.inp.db")
##D 
##D   ##Some IDs just for the example
##D   library("org.Hs.eg.db")
##D   ids = as.list(org.Hs.egUNIPROT)[10000:10500] ##get some ragged IDs
##D   ## Get entrez gene IDs (default) for uniprot IDs mapping from human to mouse.
##D   MouseEGs = inpIDMapper(ids, "HOMSA", "MUSMU")
##D   ##Get yeast uniprot IDs in exchange for uniprot IDs from human
##D   YeastUPs = inpIDMapper(ids, "HOMSA", "SACCE", destIDType="UNIPROT")
##D   ##Get yeast uniprot IDs but only return one ID per initial ID
##D   YeastUPSingles = inpIDMapper(ids, "HOMSA", "SACCE", destIDType="UNIPROT", keepMultDestIDMatches = FALSE)
##D 
##D   ##Test out the intraIDMapper function:
##D   HumanEGs = intraIDMapper(ids, species="HOMSA", srcIDType="UNIPROT",
##D   destIDType="EG")
##D   HumanPATHs = intraIDMapper(ids, species="HOMSA", srcIDType="UNIPROT",
##D   destIDType="PATH")
##D 
##D   ##Test out the wrapper function
##D   MousePATHs = idConverter(MouseEGs, srcSpecies="MUSMU", destSpecies="MUSMU",
##D   srcIDType="EG", destIDType="PATH")
##D   ##Convert from Yeast uniprot IDs to Human entrez gene IDs.
##D   HumanEGs = idConverter(YeastUPSingles, "SACCE", "HOMSA")
##D 
## End(Not run)



