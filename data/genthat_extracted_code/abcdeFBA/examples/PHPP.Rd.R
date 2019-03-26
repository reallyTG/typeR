library(abcdeFBA)


### Name: PHPP
### Title: PHPP, phenotypic phase plane analysis
### Aliases: PHPP 'phenotypic phase plane analysis'

### ** Examples

#Performing a phenotypic phase plane analysis of 
#glucose and oxygen in Core E.coli Metabolism
data(Ecoli_core)
#PHPP(reaction_number=c(28,36),fba_object=Ecoli_core,
#PCS="glucose",flux_range=c(1,15),ret_OBJ_mat=FALSE,surf_col="red")
# a menu pops up asking to select the primary carbon source, 
#select D glucose for Ecoli_core	



