library(pse)


### Name: sbma
### Title: Calculates the Symetrized Blest Measure of Agreement between two
###   samples
### Aliases: sbma sbma.default sbma.LHS

### ** Examples

# SBMA is only affected by the rank of the values inside each vector
sbma(c(1,2,3,4), c(2,3,4,5))
# Changes in the first positions: high impact on the SBMA
sbma(c(1,2,3,4), c(2,1,3,4))
cor(c(1,2,3,4), c(2,1,3,4), method="spearman")
# Changes in the last positions: low impact on the SBMA
sbma(c(1,2,3,4), c(1,2,4,3))
cor(c(1,2,3,4), c(1,2,4,3), method="spearman")



