library(KRIS)


### Name: rubikclust
### Title: Unsupervised clustering to detect rough structures and outliers.
### Aliases: rubikclust

### ** Examples

## No test: 
#Load simulated dataset
data(example_SNP)

PCs <- cal.pc.linear(simsnp$snp, no.pc = 3)

#Run rubikclust with the default parameters
groups <- rubikclust(PCs$PC)
#Check clustering results
print(groups)

#Check cluster's distribution
table(groups)

#Check the plot, highlight the points according to the clustering result
mylabels <- paste0("group", as.factor(groups))
plot3views( PCs$PC, labels = mylabels)

#Run rubikclust with min.space = 0.02
groups <- rubikclust(PCs$PC, min.space = 0.02)
#Check clustering results
print(groups)

#Check cluster's distribution
table(groups)

#Check the plot, highlight the points according to the clustering result
mylabels <- paste0("group", as.factor(groups))
plot3views( PCs$PC, labels = mylabels)
## End(No test)



