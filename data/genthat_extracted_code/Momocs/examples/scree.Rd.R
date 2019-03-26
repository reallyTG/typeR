library(Momocs)


### Name: scree
### Title: Methods for PCA eigen values
### Aliases: scree scree.PCA scree.LDA scree_min scree_plot

### ** Examples

# On PCA
bp <- PCA(efourier(bot))
scree(bp)
scree_min(bp, 0.99)
scree_min(bp, 1)

scree_plot(bp)
scree_plot(bp, 1:5)

# on LDA, it uses svd
bl <- LDA(PCA(opoly(olea)), "var")
scree(bl)




