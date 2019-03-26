library(iGasso)


### Name: MFree.test
### Title: Model-free Association Tests
### Aliases: MFree.test

### ** Examples

G = rbind(c(161, 474, 489), c(231, 444, 380))
MFree.test(G)
MFree.test(G, method = "Wald")
MFree.test(G, method = "LRT")



