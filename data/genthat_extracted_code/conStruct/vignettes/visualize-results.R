## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ------------------------------------------------------------------------
library(conStruct)
data(data.block)

## ----eval=FALSE----------------------------------------------------------
#  help(make.all.the.plots)

## ----eval=FALSE----------------------------------------------------------
#  make.all.the.plots(conStruct.results = conStruct.results,
#  					data.block = data.block,
#  					prefix = "example",
#  					layer.colors = NULL)
#  # generates a bunch of pdf figures

## ----echo=FALSE----------------------------------------------------------
admix.props <- matrix(
				c(0.086, 0.000, 0.500, 0.505, 0.099, 0.052, 0.024, 0.007, 0.800, 0.000, 0.216, 0.744, 0.917,
				0.199, 0.469, 0.000, 0.783, 0.298, 0.329, 0.446, 0.000, 0.000, 0.637, 0.903, 0.000, 0.000,
				0.000, 0.012, 0.021, 0.000, 0.000, 0.089, 0.000, 0.554, 0.002, 0.000, 0.000, 0.095, 0.020,
				0.001, 0.001, 0.011, 0.000, 0.200, 0.000, 0.060, 0.053, 0.082, 0.036, 0.013, 0.000, 0.062,
				0.169, 0.137, 0.029, 0.001, 0.000, 0.178, 0.079, 0.000, 0.999, 1.000, 0.988, 0.979, 0.975,
				1.000, 0.744, 0.984, 0.435, 0.998, 0.914, 1.000, 0.405, 0.475, 0.900, 0.947, 0.965, 0.993,
				0.000, 1.000, 0.725, 0.203, 0.000, 0.765, 0.518, 1.000, 0.154, 0.533, 0.534, 0.525, 0.999,
				1.000, 0.185, 0.018, 1.000, 0.001, 0.000, 0.000, 0.000, 0.025, 0.000, 0.167, 0.016, 0.012,
				0.000),nrow=35,ncol=3)

## ----eval=FALSE----------------------------------------------------------
#  load("my_conStruct.results.Robj")
#  
#  # assign the MAP admixture proportions from
#  #	the first MCMC chain to a variable
#  #	with a new name
#  
#  admix.props <- conStruct.results$chain_1$MAP$admix.proportions

## ---- fig.width=8,fig.height=4-------------------------------------------
# make a STRUCTURE plot using the 
#	maximum a posteriori (MAP) estimates
#	from the first chain of a conStruct run

make.structure.plot(admix.proportions = admix.props)


## ---- fig.width=8,fig.height=4-------------------------------------------

# order by membership in layer 1
make.structure.plot(admix.proportions = admix.props,
					sort.by = 1)

# re-order the stacking order of the layers
make.structure.plot(admix.proportions = admix.props,
					layer.order = c(2,1,3),
					sort.by = 2)

# provide a custom sample ordering
#	in this case by sample latitude
make.structure.plot(admix.proportions = admix.props,
					sample.order = order(data.block$coords[,2]))

# add sample names
make.structure.plot(admix.proportions = admix.props,
					sample.names = row.names(data.block$coords),
					mar = c(4.5,4,2,2))

## ----fig.width=6,fig.height=6--------------------------------------------
# make an admix pie plot using the 
#	maximum a posteriori (MAP) estimates
#	from the first chain of a conStruct run
	make.admix.pie.plot(admix.proportions = admix.props,
						coords = data.block$coords)

# increase pie chart size
	make.admix.pie.plot(admix.proportions = admix.props,
						coords = data.block$coords,
						radii = 4)
						
# zoom in on a subsection of the map
	make.admix.pie.plot(admix.proportions = admix.props,
						coords = data.block$coords,
						x.lim = c(-130,-120),
						y.lim = c(49,56))

## ----fig.width=6,fig.height=6--------------------------------------------

# add pie plot to an existing map

# make the desired map
	maps::map(xlim = range(data.block$coords[,1]) + c(-5,5), ylim = range(data.block$coords[,2])+c(-2,2), col="gray")

# add the admixture pie plot
	make.admix.pie.plot(admix.proportions = admix.props,
						coords = data.block$coords,
						add = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  # load output files from a run with
#  #	the spatial model and K=4
#  load("spK4.conStruct.results.Robj")
#  load("spK4.data.block.Robj")
#  
#  # assign to new variable names
#  spK4_cr <- conStruct.results
#  spK4_db <- data.block
#  
#  # load output files from a run with
#  #	the spatial model and K=3
#  load("spK3.conStruct.results.Robj")
#  load("spK3.data.block.Robj")
#  
#  # assign to new variable names
#  spK3_cr <- conStruct.results
#  spK3_db <- data.block
#  
#  # compare the two runs
#  compare.two.runs(conStruct.results1=spK3_cr,
#  				 data.block1=spK3_db,
#  				 conStruct.results2=spK4_cr,
#  				 data.block2=spK4_db,
#  				 prefix="spK3_vs_spK4")
#  
#  # generates a bunch of pdf figures

