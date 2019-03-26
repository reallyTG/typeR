library(bios2mds)


### Name: scree.plot
### Title: Plots the eingenvalues of an MDS analysis
### Aliases: scree.plot
### Keywords: plot

### ** Examples

# displaying the scree plot of the MDS analysis of human GPCRs
data(gpcr)
active <- gpcr$dif$sapiens.sapiens
mmds1 <- mmds(active, pc = 5)
scree.plot(mmds1$eigen.perc, lab = TRUE, title = "Scree plot of metric MDS")



