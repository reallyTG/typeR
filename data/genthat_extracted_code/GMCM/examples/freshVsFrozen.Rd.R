library(GMCM)


### Name: freshVsFrozen
### Title: Reproducibility between Fresh and Frozen B-cell subtypes
### Aliases: freshVsFrozen
### Keywords: data datasets,

### ** Examples

data(freshVsFrozen)
str(freshVsFrozen)

# Plot P-values
plot(freshVsFrozen[,c(2,4)], cex = 0.5)

# Plot ranked and scaled P-values
plot(Uhat(abs(freshVsFrozen[,c(1,3)])), cex = 0.5)



