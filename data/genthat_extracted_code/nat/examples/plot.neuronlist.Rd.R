library(nat)


### Name: plot.neuronlist
### Title: 2D plots of the elements in a neuronlist, optionally using a
###   subset expression
### Aliases: plot.neuronlist

### ** Examples

# plot 4 cells
plot(Cell07PNs[1:4])
# modify some default plot arguments
plot(Cell07PNs[1:4], ylim=c(140,75), main='First 4 neurons')
# plot one class of neurons in red and all the others in grey
plot(Cell07PNs, col=Glomerulus, colpal=c(DA1='red', 'grey'), WithNodes=FALSE)
# subset operation
plot(Cell07PNs, subset=Glomerulus%in%c("DA1", "DP1m"), col=Glomerulus,
  ylim=c(140,75), WithNodes=FALSE)



