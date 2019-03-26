library(directPA)


### Name: directExplorer2d
### Title: Batch Direction Analysis in 2-dimentional space
### Aliases: directExplorer2d

### ** Examples

# load the phosphoproteomics dataset
data(HEK)

# load the kinase-substrate annoations
data(PhosphoSite)

# test enrichment on 8 directions in polar coordinate system.
bda <- directExplorer2d(Tc=HEK, annotation=PhosphoSite.mouse)

# the direction are denoted as follow for the two treatments vs control:
# ++: up-regulated in both treatments
# +*: up-regulated in the first treatment and unchanged in the second treatment
# +-: up-regulated in the first treatment and down-regulated in the second treatment
# *-: unchanged in the first treatment and down-regulated in the second treatment
# --: down-regulated in both treatments
# -*: down-regulated in the first treatment and unchanged in the second treatment
# -+: down-regulated in the first treatment and up-regulated in the second treatment
# *+: unchanged in the first treatment and up-regulated in the second treatment

# sort the most enriched phosphorylation sites and kinases on down-regulaiton from both 
# treatments (i.e. "--") and displa the top-10 entries
bda$gene.tab[order(bda$gene.tab[,"--"]),][1:10,]
bda$path.tab[order(bda$path.tab[,"--"]),][1:10,]




