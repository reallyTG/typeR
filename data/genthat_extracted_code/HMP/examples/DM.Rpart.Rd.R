library(HMP)


### Name: DM.Rpart
### Title: Dirichlet-Multinomial RPart
### Aliases: DM.Rpart DM.Rpart.Base DM.Rpart.CV DM.Rpart.CV.Consensus

### ** Examples

	data(saliva)
	data(throat)
	data(tonsils)
	
	### Create some covariates for our data set
	site <- c(rep("Saliva", nrow(saliva)), rep("Throat", nrow(throat)), 
			rep("Tonsils", nrow(tonsils)))
	covars <- data.frame(Group=site)
	
	### Combine our data into a single object
	data <- rbind(saliva, throat, tonsils)
	
	### For a single rpart tree
	numCV <- 0
	numCon <- 0
	rpartRes <- DM.Rpart(data, covars, numCV=numCV, numCon=numCon)
	
	## Not run: 
##D 		### For a cross validated rpart tree
##D 		numCon <- 0
##D 		rpartRes <- DM.Rpart(data, covars, numCon=numCon)
##D 		
##D 		### For a cross validated rpart tree with consensus
##D 		numCon <- 2 # Note this is set to 2 for speed and should be at least 100
##D 		rpartRes <- DM.Rpart(data, covars, numCon=numCon)
##D 	
## End(Not run)



