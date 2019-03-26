library(polymapR)


### Name: cluster_per_LG
### Title: Cluster 1.0 markers into correct homologues per linkage group
### Aliases: cluster_per_LG

### ** Examples

data("SN_SN_P2", "LGHomDf_P2_1")
#take only markers in coupling:
SN_SN_P2_coupl <- SN_SN_P2[SN_SN_P2$phase=="coupling",]
cluster_per_LG(LG = 2,
               linkage_df=SN_SN_P2_coupl,
               LG_hom_stack=LGHomDf_P2_1,
               LOD_sequence=seq(4,10,2),
               modify_LG_hom_stack=FALSE,
               nclust_out=4,
               network.layout="circular",
               device=NULL,
               label.offset=1.2,
               cex.lab=0.75)



