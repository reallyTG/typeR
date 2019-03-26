library(REAT)


### Name: litzenberger2
### Title: Litzenberger-Sternberg Cluster Index
### Aliases: litzenberger2

### ** Examples

data (G.regions.industries)

lss <- litzenberger2(G.regions.industries$emp_all, 
G.regions.industries$ind_code, G.regions.industries$region_code,
G.regions.industries$area_sqkm, G.regions.industries$pop,
G.regions.industries$firms, CI.output = "df")
# output as data frame

lss_sort <- lss[order(lss$CI, decreasing = TRUE),]
# Sort decreasing by size of CI

lss_sort[1:5,]



