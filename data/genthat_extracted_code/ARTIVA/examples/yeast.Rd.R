library(ARTIVA)


### Name: yeast
### Title: Yeast stress response data
### Aliases: yeast
### Keywords: datasets

### ** Examples

####
# Datasets related to the analysis of the genomic response of the yeast 
# Saccharomyces cerevisiae to an environmental stress induced by 
# benomyl (a toxic compound).
# Analysis of the yeast data is presented in the original article of 
# ARTIVA (Lebre et al. BMC Syst. Biol, 2010)
####

# Load the yeast dataset
data(yeast)
# This is a a list that comprises information for the 18 clusters of genes
# whose expression is identically modified in strains deleted for
# YAP1, PDR1, PDR3 and YRR1 transcription factors,
# compared to the wild type strain.

# As an illustration : analysis of one cluster
cluster=4

# Different genes in a cluster is considered as repeated measurements.
# Organisation of the different time point measurements is described in
# variable : yeast[[cluster]]$dataDescription
# Beacause of repeated measurements, the minimum segment length is set to
# segMinLength = 1.
# The parentdata is the experiment design (YAP1, PDR1, PDR3 and YRR1
# deletion) described in variable: yeast[[cluster]]$parentData
# Time delay between parent and target genes is fixed to dyn=0.
## Not run: 
##D ARTIVAtest = ARTIVAsubnet(targetData = yeast[[cluster]]$targetData,
##D   targetName = yeast[[cluster]]$targetName,
##D   parentData = yeast[[cluster]]$parentData,
##D   parentNames = row.names(yeast[[cluster]]$parentData),
##D   dataDescription = yeast[[cluster]]$dataDescription,
##D   outputPath = paste("ARTIVA_Results_Cluster", cluster, sep = ""),
##D   dyn = 0,
##D   segMinLength = 1,
##D   edgesThreshold = 0.7,
##D   niter = 20000)
## End(Not run)
# Detailed results can be found in the folder named
# "ARTIVA_Results_Cluster4" (with the subfolders "Estimations" for
# detailled results of the estimated parameters and "Pictures" for
# graphical representations).



