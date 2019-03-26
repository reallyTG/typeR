library(bios2mds)


### Name: mmds
### Title: Metric multidimensional scaling
### Aliases: mmds
### Keywords: exploratory analysis

### ** Examples

# performing metric MDS of human GPCRs with projection of
# GPCRs from D. melanogaster as supplementary elements:
data(gpcr)
active <- gpcr$dif$sapiens.sapiens
mmds1 <- mmds(active = active)
mmds1$active.coord



