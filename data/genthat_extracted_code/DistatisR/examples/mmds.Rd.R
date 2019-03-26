library(DistatisR)


### Name: mmds
### Title: mmds Metric (classical) Multidimensional Scaling (a.k.a
###   Principal Coordinate Analysis) of a (Euclidean) Distance Matric
### Aliases: mmds
### Keywords: DistatisR

### ** Examples

# An example of MDS from Abdi (2007)
# Discriminability of Brain States
# Table 1.
# 1. Get the distance matrix
D <- matrix(c(
0.00, 3.47, 1.79, 3.00, 2.67, 2.58, 2.22, 3.08,
3.47, 0.00, 3.39, 2.18, 2.86, 2.69, 2.89, 2.62,
1.79, 3.39, 0.00, 2.18, 2.34, 2.09, 2.31, 2.88,
3.00, 2.18, 2.18, 0.00, 1.73, 1.55, 1.23, 2.07,
2.67, 2.86, 2.34, 1.73, 0.00, 1.44, 1.29, 2.38,
2.58, 2.69, 2.09, 1.55, 1.44, 0.00, 1.19, 2.15,
2.22, 2.89, 2.31, 1.23, 1.29, 1.19, 0.00, 2.07,
3.08, 2.62, 2.88, 2.07, 2.38, 2.15, 2.07, 0.00),
ncol = 8, byrow=TRUE)
rownames(D) <- c('Face','House','Cat','Chair','Shoe','Scissors','Bottle','Scramble')
colnames(D) <- rownames(D)
# 2. Call mmds
BrainRes <- mmds(D)
# Note that compared to Abdi (2007)
# the factor scores of mmds are equal to F / sqrt(nrow(D))
# the eigenvalues of mmds are equal to \Lambda *{1/nrow(D)}
# (ie., the normalization differs but the results are proportional)
# 3. Now a pretty plot with the prettyPlot function from prettyGraphs
prettyPlot(BrainRes$FactorScore, 
           display_names = TRUE,
           display_points = TRUE,
           contributionCircles = TRUE,
          contributions = BrainRes$Contributions)
# 4. et Voila!



