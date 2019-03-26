library(INDperform)


### Name: statespace_ch
### Title: Convex hull in 2-dimensional space
### Aliases: statespace_ch

### ** Examples

# Using the Baltic Sea demo data in the package
time <- ind_ex$Year
period_ref <- 1979:1983
period_current <- 2004:2008

# Apply function on 2 indicators
ch <- statespace_ch(x = ind_ex$TZA, y = ind_ex$MS,
 time, period_ref, period_current)

# Conduct PCA on selected indicators using the correlation matrix (scale=T)
ind_sel <- ind_ex[,c(2,3,4,8,10,11)]
pca_out <- vegan::rda(ind_sel, scale=TRUE)
pca_sum <- summary(pca_out)
prop_expl <- as.vector(pca_sum$cont$importance[2,])
scores_unsc <- vegan::scores(pca_out, scaling = 0)
scores_sites <- as.data.frame(scores_unsc$sites)
x <- scores_sites$PC1
y <- scores_sites$PC2
# Apply function
ch <- statespace_ch(x, y, time, period_ref, period_current)



