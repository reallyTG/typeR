library(mdendro)


### Name: dendesc
### Title: Dendrogram Descriptive Measures
### Aliases: dendesc ntb ultrametric mae sdr

### ** Examples

## distances between 21 cities in Europe
data(eurodist)

## comparison of dendrograms in terms of the following descriptive mesures:
## - normalized tree balance
## - cophenetic correlation coefficient
## - normalized mean absolute error
## - space distortion ratio

## single linkage (call to the mdendro package)
dendro1 <- linkage(eurodist, method="single")
ntb(dendro1)          # 0.2500664
ultr1 <- ultrametric(dendro1)
cor(eurodist, ultr1)  # 0.7842797
mae(eurodist, ultr1)  # 0.6352011
sdr(eurodist, ultr1)  # 0.150663

## complete linkage (call to the stats package)
dendro2 <- as.dendrogram(hclust(eurodist, method="complete"))
ntb(dendro2)          # 0.8112646
ultr2 <- ultrametric(dendro2)
cor(eurodist, ultr2)  # 0.735041
mae(eurodist, ultr2)  # 0.8469728
sdr(eurodist, ultr2)  # 1

## unweighted arithmetic linkage (UPGMA)
dendro3 <- linkage(eurodist, method="arithmetic", weighted=FALSE)
ntb(dendro3)          # 0.802202
ultr3 <- ultrametric(dendro3)
cor(eurodist, ultr3)  # 0.7279432
mae(eurodist, ultr3)  # 0.294578
sdr(eurodist, ultr3)  # 0.5066903

## unweighted geometric linkage
dendro4 <- linkage(eurodist, method="geometric", weighted=FALSE)
ntb(dendro4)          # 0.7531278
ultr4 <- ultrametric(dendro4)
cor(eurodist, ultr4)  # 0.7419569
mae(eurodist, ultr4)  # 0.2891692
sdr(eurodist, ultr4)  # 0.4548112




