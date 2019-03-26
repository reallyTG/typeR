library(miRNAss)


### Name: eigenDecomposition
### Title: MiRNAss: Genome-wide pre-miRNA discovery from few labeled
###   examples
### Aliases: eigenDecomposition

### ** Examples

# First construct the label vector with the CLASS column
y = as.numeric(celegans$CLASS)*2 - 1

# Remove some labels to make a test
y[sample(which(y>0),200)] = 0
y[sample(which(y<0),700)] = 0

# Take all the features but remove the label column
x = subset(celegans, select = -CLASS)

A = adjacencyMatrixKNN(x, y, 10, 8)
E = eigenDecomposition(AdjMatrix = A, nEigenVectors = 100)
for (mp in c(0.1,1,10)) {
    p = miRNAss(sequenceLabels = y, AdjMatrix = A,
                eigenVectors = E, missPenalization = mp)
    # Calculate some performance measures
    SE = mean(p[ celegans$CLASS & y==0] > 0)
    SP = mean(p[!celegans$CLASS & y==0] < 0)
    cat("mP: ", mp, "\n  SE: ", SE, "\n  SP:   ", SP, "\n")
}



