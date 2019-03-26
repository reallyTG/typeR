library(tmod)


### Name: eigengene
### Title: Calculate the eigengene of a module from a data set
### Aliases: eigengene

### ** Examples

data(Egambia)
data(tmod)
x <- Egambia[ , -c(1:3) ]
ifns <- tmod[ grep("[Ii]nterferon", tmod$MODULES$Title) ]
eigv <- eigengene(x, Egambia$GENE_SYMBOL, ifns)
plot(eigv["LI.M127", ], eigv["DC.M1.2",])

# which interferon modules are correlated
cor(eigv) 



