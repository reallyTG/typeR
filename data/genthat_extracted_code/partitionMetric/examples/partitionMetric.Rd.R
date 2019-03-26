library(partitionMetric)


### Name: partitionMetric
### Title: Compute a distance metric between two partitions of a set
### Aliases: partitionMetric

### ** Examples

## Define several partitions of a 4-element set
gender <- c('boy',   'girl', 'girl',   'boy')
height <- c('short', 'tall', 'medium', 'tall')
age    <- c(7,       6,      5,        4)    

## Compute some distances
(dGG <- partitionMetric (gender, gender))
(dGH <- partitionMetric (gender, height))
(dHG <- partitionMetric (height, gender))
(dGA <- partitionMetric (gender, age))
(dHA <- partitionMetric (height, age))

## These properties must hold for any metric 
dGG == 0
dGH == dHG
dGA <= dGH + dHA

## Note that the partition names are irrelevant, and only need to be
## self-consistent within each B and C.  It follows that these two set
## partitions are identical and have distance 0.
partitionMetric (c(1,8,8), c(7,3,3)) == 0


## Use the set partition to measure amino acid acid sequence differences
## between several alleles of the aryl hydrocarbon receptor.

data(AhRs)
dim(AhRs)
AhRs[,1:10]

distanceMatrix <-
  matrix(nrow=nrow(AhRs), ncol=nrow(AhRs), 0,
         dimnames=list(rownames(AhRs), rownames(AhRs)))

for (pair in combn(rownames(AhRs), 2, simplify=FALSE)) {
  d <- partitionMetric (AhRs[pair[1],], AhRs[pair[2],], beta=1.01)
  distanceMatrix[pair[1],pair[2]] <- distanceMatrix[pair[2],pair[1]] <- d
}

hc <- hclust(as.dist(distanceMatrix))
plot(hc,
     sub=sprintf('Cophenentic correlation between distances and tree is %0.2f',
       cor(as.dist(distanceMatrix), cophenetic(hc))))



