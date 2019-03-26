library(nat.nblast)


### Name: nblast
### Title: Calculate similarity score for neuron morphologies
### Aliases: nblast

### ** Examples

# load sample Kenyon cell data from nat package
data(kcs20, package='nat')
# search one neuron against all neurons
scores=nblast(kcs20[['GadMARCM-F000142_seg002']], kcs20)
# scores from best to worst, top hit is of course same neuron
sort(scores, decreasing = TRUE)
hist(scores, breaks=25, col='grey')
abline(v=1500, col='red')

# plot query neuron
open3d()
# plot top 3 hits (including self match with thicker lines)
plot3d(kcs20[which(sort(scores, decreasing = TRUE)>1500)], lwd=c(3,1,1))
rest=names(which(scores<1500))
plot3d(rest, db=kcs20, col='grey', lwd=0.5)

# normalised scores (i.e. self match = 1) of all neurons vs each other
# note use of progress bar
scores.norm=nblast(kcs20, kcs20, normalised = TRUE, .progress="text")
hist(scores.norm, breaks=25, col='grey')
# produce a heatmap from normalised scores
jet.colors <- colorRampPalette( c("blue", "green", "yellow", "red") )
heatmap(scores.norm, labCol = with(kcs20,type), col=jet.colors(20), symm = TRUE)

## Not run: 
##D # Parallelise NBLASTing across 4 cores using doMC package
##D library(doMC)
##D registerDoMC(4)
##D scores.norm2=nblast(kcs20, kcs20, normalised=TRUE, .parallel=TRUE)
##D stopifnot(all.equal(scores.norm2, scores.norm))
## End(Not run)



