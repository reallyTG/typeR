library(PortfolioAnalytics)


### Name: centroid.sectors
### Title: Multiple Sectors Centroid
### Aliases: centroid.sectors

### ** Examples

# Express a view on the assets in two sectors
# Sector 1 View: R_2 < R_1 < R_3
# Sector 2 View: R_5 < R_4
x <- list()
x[[1]] <- c(2, 1, 3)
x[[2]] <- c(5, 4)
centroid.sectors(x)



