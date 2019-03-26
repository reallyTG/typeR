library(bios2mds)


### Name: mmds.3D.plot
### Title: Display the mmds coordinates onto a 3D space
### Aliases: mmds.3D.plot
### Keywords: plot, 3D

### ** Examples

# 3D plot of human GPCRs onto the first three axes obained from MDS analysis
# with projection of GPCRs from D. melanogaster as supplementary elements:
data(gpcr)
mmds.3D.plot(gpcr$mmds$sapiens.active,active.type="p",label=FALSE,lit=FALSE,
point_antialias=TRUE,box.lwd=3,sup.size=4.3,active.size=4.3)
bbox3d(shininess=0.5)




