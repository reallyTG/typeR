library(miRNAss)


### Name: miRNAss
### Title: MiRNAss: Genome-wide pre-miRNA discovery from few labeled
###   examples
### Aliases: miRNAss

### ** Examples

# First construct the label vector with the CLASS column
y = as.numeric(celegans$CLASS)*2 - 1

# Remove some labels to make a test
y[sample(which(y>0),200)] = 0
y[sample(which(y<0),700)] = 0

# Take all the features but remove the label column
x = subset(celegans, select = -CLASS)

# Call miRNAss with default parameters
p = miRNAss(x,y)

# Calculate some performance measures
SE = mean(p[ celegans$CLASS & y==0] > 0)
SP = mean(p[!celegans$CLASS & y==0] < 0)
cat("Sensitivity: ", SE, "\nSpecificity: ", SP, "\n")




