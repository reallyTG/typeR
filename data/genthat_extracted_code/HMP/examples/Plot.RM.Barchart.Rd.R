library(HMP)


### Name: Plot.RM.Barchart
### Title: Plot the Pi Vector for Repeated Measures
### Aliases: Plot.RM.Barchart

### ** Examples

	## Not run: 
##D 		data(saliva)
##D 		data(throat)
##D 		
##D 		### Reduce the size of the data
##D 		saliva <- Data.filter(saliva, numTaxa=9)
##D 		throat <- Data.filter(throat, numTaxa=9)
##D 		
##D 		### Get the gamma value for the data
##D 		saliva.gamma <- DM.MoM(saliva)$gamma
##D 		throat.gamma <- DM.MoM(throat)$gamma
##D 		mid.gamma <- (saliva.gamma + throat.gamma)/2
##D 		
##D 		### Generate a the number of reads per sample
##D 		### The first number is the number of reads and the second is the number of subjects
##D 		nrs <- rep(10000, 20)
##D 		
##D 		### Create data sets to be our time series in a list
##D 		group.data <- list(
##D 				Dirichlet.multinomial(nrs, saliva.gamma),
##D 				Dirichlet.multinomial(nrs, saliva.gamma),
##D 				Dirichlet.multinomial(nrs, saliva.gamma),
##D 				Dirichlet.multinomial(nrs, saliva.gamma),
##D 				Dirichlet.multinomial(nrs, mid.gamma),
##D 				Dirichlet.multinomial(nrs, throat.gamma)
##D 		)
##D 		names(group.data) <- c(
##D 				"Group 1, Time 1", "Group 2, Time 1",
##D 				"Group 1, Time 2", "Group 2, Time 2",
##D 				"Group 1, Time 3", "Group 2, Time 3"
##D 		)
##D 		
##D 		### Set the group and time information for each list element
##D 		groups <- c(1, 2, 1, 2, 1, 2)
##D 		times <- c(1, 2, 3, 1, 2, 3)
##D 		
##D 		### Plot the data by Group
##D 		Plot.RM.Barchart(group.data, groups, times)
##D 		
##D 		### Plot the data by Time
##D 		Plot.RM.Barchart(group.data, groups, times, FALSE)
##D 	
## End(Not run)



