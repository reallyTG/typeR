library(bios2mds)


### Name: mmds.plot
### Title: Plots a summary of the mmds results
### Aliases: mmds.plot
### Keywords: plot

### ** Examples

# summary plot of the MDS analysis of human GPCRs with projection of GPCRs
# from D. melanogaster as supplementary elements:
data(gpcr)
mmds.plot(gpcr$mmds$sapiens.active,gpcr$mmds$melanogaster.project)



