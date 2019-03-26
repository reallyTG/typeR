library(phylosim)


### Name: plot.DiscreteDeletor
### Title: Plot the deletion length distribution
### Aliases: plot.DiscreteDeletor DiscreteDeletor.plot
###   plot,DiscreteDeletor-method

### ** Examples

	d<-DiscreteDeletor(
		name="MyDiscDel",
		sizes=1:6,
		probs=c(0.25000000, 0.16666667, 0.08333333, 0.08333333, 0.16666667, 0.25000000)
	)
	# plot the deletion length distribution
	plot(d)
 


