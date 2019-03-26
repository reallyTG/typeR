library(FRESA.CAD)


### Name: listTopCorrelatedVariables
### Title: List the variables that are highly correlated with each other
### Aliases: listTopCorrelatedVariables
### Keywords: Data_Inspection

### ** Examples

	## Not run: 
##D 	# Start the graphics device driver to save all plots in a pdf format
##D 	pdf(file = "Example.pdf")
##D 	# Get the stage C prostate cancer data from the rpart package
##D 	library(rpart)
##D 	data(stagec)
##D 	# Split the stages into several columns
##D 	dataCancer <- cbind(stagec[,c(1:3,5:6)],
##D 	                    gleason4 = 1*(stagec[,7] == 4),
##D 	                    gleason5 = 1*(stagec[,7] == 5),
##D 	                    gleason6 = 1*(stagec[,7] == 6),
##D 	                    gleason7 = 1*(stagec[,7] == 7),
##D 	                    gleason8 = 1*(stagec[,7] == 8),
##D 	                    gleason910 = 1*(stagec[,7] >= 9),
##D 	                    eet = 1*(stagec[,4] == 2),
##D 	                    diploid = 1*(stagec[,8] == "diploid"),
##D 	                    tetraploid = 1*(stagec[,8] == "tetraploid"),
##D 	                    notAneuploid = 1-1*(stagec[,8] == "aneuploid"))
##D 	# Remove the incomplete cases
##D 	dataCancer <- dataCancer[complete.cases(dataCancer),]
##D 	# Load a pre-stablished data frame with the names and descriptions of all variables
##D 	data(cancerVarNames)
##D 	# Get the variables that have a correlation coefficient larger 
##D 	# than 0.65 at a p-value of 0.05
##D 	cor <- listTopCorrelatedVariables(variableList = cancerVarNames,
##D 	                                  data = dataCancer,
##D 	                                  pvalue = 0.05,
##D 	                                  corthreshold = 0.65,
##D 	                                  method = "pearson")
##D 	# Shut down the graphics device driver
##D 	dev.off()
## End(Not run)



