library(asnipe)


### Name: gmmevents
### Title: Infer gathering events
### Aliases: gmmevents

### ** Examples


## No test: 

	library(asnipe)
	data("identified_individuals")
	
	# Create unique locations in time
	identified_individuals$Loc_date <- 
		paste(identified_individuals$Location,
		identified_individuals$Date,sep="_")

	# Provide global identity list (including individuals 
	# not found in these data, but that need to be included).
	# Not including this will generate gbi with only the
	# individuals provided in the data set (in this case 151
	# individuals)
	global_ids <- levels(identified_individuals$ID)
	
	# Generate GMM data
	gmm_data <- gmmevents(time=identified_individuals$Time,
		identity=identified_individuals$ID,
		location=identified_individuals$Loc_date,
		global_ids=global_ids)

	# Extract output
	gbi <- gmm_data$gbi
	events <- gmm_data$metadata
	observations_per_event <- gmm_data$B

	# Can also subset gbi to only individuals observed
	# in the dataset to give same answer as if 
	# global_ids had not been provided
	gbi <- gbi[,which(colSums(gbi)>0)]

	# Split up location and date data
	tmp <- strsplit(events$Location,"_")
	tmp <- do.call("rbind",tmp)
	events$Location <- tmp[,1]
	events$Date <- tmp[,2]

## End(No test)




