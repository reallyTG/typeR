library(provenance)


### Name: PCA
### Title: Principal Component Analysis
### Aliases: PCA

### ** Examples

data(Namib)
plot(MDS(Namib$Major,classical=TRUE))
dev.new()
plot(PCA(Namib$Major),asp=1)
print("This example demonstrates the equivalence of classical MDS and PCA")



