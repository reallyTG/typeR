library(GISTools)


### Name: Kernel Density Estimates From Points
### Title: Kernel Density Estimates
### Aliases: kde.points

### ** Examples

# Data for New Haven to use in example
data(newhaven)
# Do the KDE
breach.dens = kde.points(breach,lims=tracts)
# Plot the result
level.plot(breach.dens)
# Block out the part outside the study area
masker = poly.outer(breach.dens,tracts,extend=100); add.masking(masker)
# Plot census tract boundaries
plot(tracts,add=TRUE)



