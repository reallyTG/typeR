library(partitionComparison)


### Name: compareAll
### Title: Compare two partitions with all measures
### Aliases: compareAll compareAll,Partition,Partition-method

### ** Examples

compareAll(new("Partition", c(0, 0, 0, 1, 1)), new("Partition", c(0, 0, 1, 1, 1)))
## Not run: 
##D                         measure       value
##D  1            adjustedRandIndex 0.166666667
##D  2                     baulieu1 0.760000000
##D  3                     baulieu2 0.040000000
##D  4  classificationErrorDistance 0.200000000
##D  5                  czekanowski 0.500000000
##D  6                dongensMetric 2.000000000
##D  7                 fagerMcGowan 0.250000000
##D  8          folwkesMallowsIndex 0.500000000
##D  9              gammaStatistics 0.166666667
##D  10              goodmanKruskal 0.333333333
##D  11               gowerLegendre 0.750000000
##D  12                      hamann 0.200000000
##D  13          jaccardCoefficient 0.333333333
##D  14                  kulczynski 0.500000000
##D  15                  larsenAone 0.800000000
##D  16                 lermanIndex 0.436435780
##D  17                mcconnaughey 0.000000000
##D  18            minkowskiMeasure 1.000000000
##D  19                mirkinMetric 8.000000000
##D  20           mutualInformation 0.291103166
##D  21       normalizedLermanIndex 0.166666667
##D  22 normalizedMutualInformation 0.432538068
##D  23                     pearson 0.006944444
##D  24                      peirce 0.166666667
##D  25                   randIndex 0.600000000
##D  26              rogersTanimoto 0.428571429
##D  27                   russelRao 0.200000000
##D  28               rvCoefficient 0.692307692
##D  29                sokalSneath1 0.583333333
##D  30                sokalSneath2 0.200000000
##D  31                sokalSneath3 0.333333333
##D  32      variationOfInformation 0.763817002
##D  33                    wallaceI 0.500000000
##D  34                   wallaceII 0.500000000
## End(Not run)




