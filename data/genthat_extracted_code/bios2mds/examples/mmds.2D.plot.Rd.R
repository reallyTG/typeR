library(bios2mds)


### Name: mmds.2D.plot
### Title: Plots the mmds coordinates onto a 2D space
### Aliases: mmds.2D.plot
### Keywords: plot

### ** Examples

# scatter plot of human GPCRs onto the first two axes obtained from MDS analysis
# with projection of GPCRs from D. melanogaster as supplementary elements:
data(gpcr)
active <- gpcr$dif$sapiens.sapiens
mmds_active <- mmds(active,group.file=system.file(
"csv/human_gpcr_group.csv",package = "bios2mds"))
mmds.2D.plot(mmds_active, active.alpha = 0.5, active.lab = TRUE)

# with group information
sup <- gpcr$dif$melanogaster.sapiens
mmds_sup <- mmds.project(mmds_active, sup,group.file=system.file(
"csv/drome_gpcr_group.csv",package = "bios2mds"))
mmds.2D.plot(mmds_active,mmds_sup)



