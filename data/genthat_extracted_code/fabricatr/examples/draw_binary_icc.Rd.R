library(fabricatr)


### Name: draw_binary_icc
### Title: Draw binary data with fixed intra-cluster correlation.
### Aliases: draw_binary_icc

### ** Examples

# Divide units into clusters
clusters = rep(1:5, 10)

# Default probability 0.5, default ICC 0
draw_binary_icc(clusters = clusters)

# Specify probability or ICC
corr_draw = draw_binary_icc(prob = 0.5, clusters = clusters, ICC = 0.5)

# Verify ICC of data.
summary(lm(corr_draw ~ as.factor(clusters)))$r.squared




