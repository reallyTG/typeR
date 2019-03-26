library(SDDE)


### Name: save_network
### Title: is an helper function to save an illustration of a network into
###   a file
### Aliases: save_network
### Keywords: Augmented network, save function, png, svg

### ** Examples

	## Not run: 
##D 		data(Sample_1)
##D 		## Save the networks to file using the default layout (layout.kamada.kawai)
##D 		## and size (1200px)
##D 		save_network(g1,g2,filename="sample1",imagesize=1200)
##D 		## Save the networks to a file using the layout.fruchterman.reingold layout, 
##D 		## and in 'svg' format
##D 		save_network(g1,g2,filename="s", mode="svg",layout=layout.fruchterman.reingold)
##D 		## Save a network containing different groups
##D 		gsample <- random_network(ngroup=4)
##D 		save_network(gsample$g1,gsample$g2,filename="gsample", taxnames="allgroup")
##D 	
## End(Not run)



