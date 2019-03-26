library(semtree)


### Name: semtree.control
### Title: SEM Tree Control Object
### Aliases: semtree.control print.semtree.control

### ** Examples


	# create a control object with an alpha level of 1%
	my.control <- semtree.control(alpha=0.01)

	# set the minimum number of cases per node to ten
	my.control$min.N <- 10
	
	# print contents of the control object
	print(my.control)




