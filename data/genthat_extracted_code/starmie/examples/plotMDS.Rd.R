library(starmie)


### Name: plotMDS
### Title: Plot principal coordinates from Q-matrix, struct or admix
###   objects
### Aliases: plotMDS

### ** Examples

# struct example
k6_data <- exampleStructure("barplot")
plotMDS(k6_data)
plotMDS(k6_data, method = "jsd")
# admix example
k3_data <- exampleAdmixture()[[3]]
plotMDS(k3_data)



