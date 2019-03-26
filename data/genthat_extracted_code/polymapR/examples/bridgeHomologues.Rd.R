library(polymapR)


### Name: bridgeHomologues
### Title: Use bridge markers to cluster homologues into linkage groups
### Aliases: bridgeHomologues assembleDuplexLinks

### ** Examples

data("P1_homologues", "P2_homologues", "SN_DN_P1", "SN_SS_P1", "SN_SS_P2")
ChHomDf<-bridgeHomologues(cluster_stack = P1_homologues[["5"]],
                 linkage_df=SN_DN_P1,
                 LOD_threshold=4,
                 automatic_clustering=TRUE,
                 LG_number=5,
                 parentname="P1")

ChHomDf<-bridgeHomologues(cluster_stack = P1_homologues[["5"]],
                           cluster_stack2 = P2_homologues[["5"]],
                 linkage_df=SN_SS_P1,
                 linkage_df2=SN_SS_P2,
                 LOD_threshold=4,
                 automatic_clustering=TRUE,
                 LG_number=5,
                 parentname="P1")



