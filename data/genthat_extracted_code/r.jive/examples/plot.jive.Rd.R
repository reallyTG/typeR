library(r.jive)


### Name: plot.jive
### Title: Create Plots for a JIVE Object
### Aliases: plot.jive

### ** Examples

##Load JIVE results (using default settings) for simulated data 
##as in Section 2.4 of Lock et al., 2013,
##with rank 1 joint structure, and rank 1 individual structure for each dataset
data(SimResults) 
# Visualize results
# Bar plot of variation explained
plot(Results)
# Heatmap
plot(Results,type="heat")
# Principal compontents plots
plot(Results,type="pca",1,c(1,1))



