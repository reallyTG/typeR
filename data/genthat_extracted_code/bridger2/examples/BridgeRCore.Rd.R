library(bridger2)


### Name: BridgeRCore
### Title: BridgeR basic function for calculating RNA half-life from
###   BRIC-seq data
### Aliases: BridgeRCore

### ** Examples

halflife_table <- BridgeRCore(RNA_halflife_comparison[1:30,],
                              save = FALSE)
halflife_table <- BridgeRCore(RNA_halflife_comparison_HK[177:206],
                              save = FALSE,
                              normalization = "house_keeping_genes",
                              method = "3models")




