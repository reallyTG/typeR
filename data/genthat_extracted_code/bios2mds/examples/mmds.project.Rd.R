library(bios2mds)


### Name: mmds.project
### Title: Metric multidimensional Scaling Projection
### Aliases: mmds.project
### Keywords: exploratory analysis

### ** Examples

# performing metric MDS of human GPCRs with projection of
# GPCRs from D. melanogaster as supplementary elements:
data(gpcr)
active <- gpcr$dif$sapiens.sapiens
sup <- gpcr$dif$melanogaster.sapiens
mmds_active<-mmds(active)
mmds_sup <- mmds.project(mmds_active,sup)



