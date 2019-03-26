library(MoEClust)


### Name: MoE_Uncertainty
### Title: Plot Clustering Uncertainties
### Aliases: MoE_Uncertainty
### Keywords: plotting

### ** Examples

data(ais)
res <- MoE_clust(ais[,3:7], gating= ~ sex, G=3, modelNames="EEE", network.data=ais)

# Produce an uncertainty barplot
MoE_Uncertainty(res)

# Produce an uncertainty profile plot
MoE_Uncertainty(res, type="profile")

# Let's assume the true clusters correspond to sex
(ub <- MoE_Uncertainty(res, truth=ais$sex))
(up <- MoE_Uncertainty(res, type="profile", truth=ais$sex))



