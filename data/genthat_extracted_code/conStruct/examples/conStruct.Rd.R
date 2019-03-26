library(conStruct)


### Name: conStruct
### Title: Run a conStruct analysis.
### Aliases: conStruct

### ** Examples

# load example dataset
data(conStruct.data)

# run example spatial analysis with K=1
	#	
# for this example, make.figs and save.files
#	are set to FALSE, but most users will want them 
#	set to TRUE
my.run <- conStruct(spatial = TRUE,
		 			K = 1,
		 			freqs = conStruct.data$allele.frequencies,
		 			geoDist = conStruct.data$geoDist,
		 			coords = conStruct.data$coords,
		 			prefix = "test",
		 			n.chains = 1,
		 			n.iter = 1e3,
		 			make.figs = FALSE,
		 			save.files = FALSE)




