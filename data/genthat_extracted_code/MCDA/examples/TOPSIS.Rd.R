library(MCDA)


### Name: TOPSIS
### Title: Technique for Order of Preference by Similarity to Ideal
###   Solution (TOPSIS) method
### Aliases: TOPSIS

### ** Examples

performanceTable <- matrix(c(5490,51.4,8.5,285,6500,70.6,7,
                              288,6489,54.3,7.5,290),
                              nrow=3,
                              ncol=4,
                              byrow=TRUE)

row.names(performanceTable) <- c("Corsa","Clio","Fiesta")

colnames(performanceTable) <- c("Purchase Price","Economy",
                                   "Aesthetics","Boot Capacity")

weights <- c(0.35,0.25,0.25,0.15)

criteriaMinMax <- c("min", "max", "max", "max")

positiveIdealSolutions <- c(0.179573776, 0.171636015, 0.159499658, 0.087302767)
negativeIdealSolutions <- c(0.212610118, 0.124958799, 0.131352659, 0.085797547)

names(weights) <- colnames(performanceTable)
names(criteriaMinMax) <- colnames(performanceTable)
names(positiveIdealSolutions) <- colnames(performanceTable)
names(negativeIdealSolutions) <- colnames(performanceTable)

overall1 <- TOPSIS(performanceTable, weights, criteriaMinMax)

overall2 <- TOPSIS(performanceTable,
                       weights, 
                       criteriaMinMax,
                       positiveIdealSolutions,
                       negativeIdealSolutions)

overall3 <- TOPSIS(performanceTable,
                      weights,
                      criteriaMinMax,
                      alternativesIDs = c("Corsa","Clio"),
                      criteriaIDs = c("Purchase Price","Economy","Aesthetics"))

overall4 <- TOPSIS(performanceTable, 
                    weights,
                    criteriaMinMax,
                    positiveIdealSolutions,
                    negativeIdealSolutions,
                    alternativesIDs = c("Corsa","Clio"), 
                    criteriaIDs = c("Purchase Price","Economy","Aesthetics"))



