library(nat.nblast)


### Name: create_scoringmatrix
### Title: Create a scoring matrix given matching and non-matching sets of
###   neurons
### Aliases: create_scoringmatrix

### ** Examples

## Not run: 
##D # calculate scoring matrix
##D # bring in some mushroom body neurons
##D library(nat)
##D data(kcs20)
##D # convert the (connected) tracings into dotprops (point and vector)
##D # representation, resampling at 1 micron intervals along neuron
##D fctraces20.dps=dotprops(fctraces20, resample=1)
##D # we will use both all kcs vs all fctraces20 and fctraces20 vs fctraces20
##D # as random_pairs to make the null distribution
##D random_pairs=rbind(neuron_pairs(fctraces20), neuron_pairs(nat::kcs20, fctraces20))
##D smat=create_scoringmatrix(kcs20, c(kcs20, fctraces20.dps),
##D                           non_matching_subset=random_pairs, .progress='text')
##D 
##D # now plot the scoring matrix
##D distbreaks=attr(smat,'distbreaks')
##D distbreaks=distbreaks[-length(distbreaks)]
##D dotprodbreaks=attr(smat,'dotprodbreaks')[-1]
##D # Create a function interpolating colors in the range of specified colors
##D jet.colors <- colorRampPalette( c("blue", "green", "yellow", "red") )
##D # 2d filled contour plot of scoring matrix. Notice that the there is a region
##D # at small distances and large abs dot product with the highest log odds ratio
##D # i.e. most indicative of a match rather than non-match
##D filled.contour(x=distbreaks, y=dotprodbreaks, z=smat, col=jet.colors(20),
##D   main='smat: log odds ratio', xlab='distance /um', ylab='abs dot product')
##D 
##D # 3d perspective plot of the scoring matrix
##D persp3d(x=distbreaks, y=dotprodbreaks, z=smat, col=jet.colors(20)[cut(smat,20)],
##D xlab='distance /um', ylab='abs dot product', zlab='log odds ratio')
## End(Not run)



