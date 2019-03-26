library(miRNAss)


### Name: adjacencyMatrixKNN
### Title: MiRNAss: Genome-wide pre-miRNA discovery from few labeled
###   examples
### Aliases: adjacencyMatrixKNN

### ** Examples

# First construct the label vector with the CLASS column
y = as.numeric(celegans$CLASS)*2 - 1

# Remove some labels to make a test
y[sample(which(y>0),200)] = 0
y[sample(which(y<0),700)] = 0

# Take all the features but remove the label column
x = subset(celegans, select = -CLASS)

A = adjacencyMatrixKNN(x, y, 10, 8)

for (nev in seq(50,200, 50)) {
    # the data frame of features 'x' should not be pass as parameter
    p = miRNAss(sequenceLabels = y, AdjMatrix = A,
                nEigenVectors = nev)
    # Calculate some performance measures
    SE = mean(p[ celegans$CLASS & y==0] > 0)
    SP = mean(p[!celegans$CLASS & y==0] < 0)
    cat("N: ", nev, "\n  SE: ", SE, "\n  SP:   ", SP, "\n")
}



