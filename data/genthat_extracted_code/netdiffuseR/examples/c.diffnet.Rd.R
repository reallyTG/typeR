library(netdiffuseR)


### Name: c.diffnet
### Title: Combine diffnet objects
### Aliases: c.diffnet

### ** Examples

# Calculate structural equivalence exposure by city -------------------------
data(medInnovationsDiffNet)

# Subsetting diffnets
city1 <- medInnovationsDiffNet[medInnovationsDiffNet[["city"]] == 1]
city2 <- medInnovationsDiffNet[medInnovationsDiffNet[["city"]] == 2]
city3 <- medInnovationsDiffNet[medInnovationsDiffNet[["city"]] == 3]
city4 <- medInnovationsDiffNet[medInnovationsDiffNet[["city"]] == 4]

# Computing exposure in each one
city1[["expo_se"]] <- exposure(city1, alt.graph="se", valued=TRUE)
city2[["expo_se"]] <- exposure(city2, alt.graph="se", valued=TRUE)
city3[["expo_se"]] <- exposure(city3, alt.graph="se", valued=TRUE)
city4[["expo_se"]] <- exposure(city4, alt.graph="se", valued=TRUE)

# Concatenating all
diffnet <- c(city1, city2, city3, city4)
diffnet





